class Symptom < ActiveRecord::Base

  def self.normalize_symptoms
    Symptom.all.each do |symptom|
      if symptom.name.include? ","
        normalized_symptom = symptom.name.split(",").reverse.join("").strip
        Symptom.find_by(:name => symptom.name).update(:name => normalized_symptom)
      end
    end
  end

  def self.set_actives
    Symptom.all.each do |symptom|
      @search = Disease.search do
        fulltext "\"#{symptom.name}\"" do
          minimum_match 1
        end
      end

      if @search.results.size > 0
        symptom.active = true
      else
        symptom.active = false
      end

      symptom.save
    end
  end

  def self.active
    Symptom.where(:active => true)
  end

  def self.strip_symptoms
    Symptom.all.each do |symptom| 
      stripped_name = symptom.name.strip
      symptom.update(:name => stripped_name)
    end
  end

  def self.dedupe
    grouped = Symptom.all.group_by{|symptom| [symptom.name] }
    grouped.values.each do |duplicates|
      first_one = duplicates.shift
      duplicates.each{|double| double.destroy}
    end
  end

end
