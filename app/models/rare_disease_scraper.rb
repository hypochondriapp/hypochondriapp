require 'open-uri'

class RareDiseaseScraper

  PAGE1 = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/Category:Rare_diseases'))
  PAGE2 = Nokogiri::HTML(open('http://en.wikipedia.org/w/index.php?title=Category:Rare_diseases&pagefrom=Gaucher%27s+Disease%0AGaucher%27s+disease#mw-pages'))
  PAGE3 = Nokogiri::HTML(open('http://en.wikipedia.org/w/index.php?title=Category:Rare_diseases&pagefrom=Northern+epilepsy+syndrome#mw-pages'))

  def self.scrape
    # find_diseases(PAGE1)
    find_diseases(PAGE1)
    find_diseases(PAGE2)
    find_diseases(PAGE3)
  end

  def self.find_diseases(page)
    diseases_array = page.css('div.mw-content-ltr')[2]
    diseases_hash = diseases_array.css('a[href]').each_with_object({}) { |n, h| h[n.text.strip] = n['href'] }
    create_disease(diseases_hash)
  end

  def self.create_disease(diseases_hash)
    diseases_hash.each do |disease_name, disease_url|
      Disease.create(:name => disease_name, :url => disease_url)
    end
  end

  def self.scrape_pages
    Disease.all[1..100].each do |disease|
      page = Nokogiri::HTML(open("http://en.wikipedia.org#{disease.url}"))
      disease_info = find_content(page)
      disease.page_content = disease_info
      disease.save
    end
  end

  def self.find_content(page)
    page.css('p').text
  end

end
