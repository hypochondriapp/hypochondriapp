class Symptom < ActiveRecord::Base

  def self.normalize_symptoms
    Symptom.all.each do |symptom|
      if symptom.name.include? ","
        normalized_symptom = symptom.name.split(",").reverse.join("").strip
        Symptom.find_by(:name => symptom.name).update(:name => normalized_symptom)
      end
    end
  end

end
