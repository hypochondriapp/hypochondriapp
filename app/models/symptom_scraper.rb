require 'open-uri'

class SymptomScraper

  Symptoms_URL = "http://www.bettermedicine.com/symptoms/site-map/"

  def self.scrape
    letter_array = ("a".."z").to_a
    letter_array.each do |letter|
      page = Nokogiri::HTML(open("http://www.rxlist.com/symptoms_and_signs/alpha_#{letter}.htm"))
      find_symptom_names(page)
    end
  end

  def self.find_symptom_names(page)
    page.css('div.AZ_results li').each do |symptom_object| 
      symptom_name = symptom_object.css('a').text
      add_symptom(symptom_name)
    end
  end

  def self.add_symptom(symptom_name)
    if symptom_name.include? "("
      #write another if/else statement here for when there is parenthesis AND commas.
      #if there are commas, we will need to swap the order to match symptoms as they might appear in a database
      normalize_and_add_symptoms(symptom_name) 
    else 
      Symptom.find_or_create_by(:name => symptom_name)
    end
  end

  def self.normalize_and_add_symptoms(symptom_name)
    symptoms_array = symptom_name.split(/\(|\)/)
    symptoms_array.each do |symptom|
      Symptom.find_or_create_by(:name => symptom)
    end
  end

end