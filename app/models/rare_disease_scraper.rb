require 'open-uri'

class RareDiseaseScraper

  PAGE1 = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/Category:Rare_diseases'))
  PAGE2 = Nokogiri::HTML(open('http://en.wikipedia.org/w/index.php?title=Category:Rare_diseases&pagefrom=Gaucher%27s+Disease%0AGaucher%27s+disease#mw-pages'))
  PAGE3 = Nokogiri::HTML(open('http://en.wikipedia.org/w/index.php?title=Category:Rare_diseases&pagefrom=Northern+epilepsy+syndrome#mw-pages'))

  def self.scrape
    # find_diseases(PAGE1)
    find_diseases(PAGE3)
  end

  def self.find_diseases(page)
    diseases_array = page.css('div.mw-content-ltr')[2]
    diseases_hash = diseases_array.css('a[href]').each_with_object({}) { |n, h| h[n.text.strip] = n['href'] }
    puts find_names(diseases_hash)
    puts find_urls(diseases_hash)
  end

  def self.find_names(diseases_hash)
    diseases_hash.keys
  end

  def self.find_urls(diseases_hash)
    diseases_hash.values
  end
end
