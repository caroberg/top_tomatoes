require 'pry'

class TopTomatoes::Film 
  attr_accessor :title, :review_rating, :film_url, :genre, :film_rating, :director, :film_synopsis, :trailer
  @@today = []
  
  def initialize(film_hash)
    film_hash.each {|key, value| self.send(("#{key}="), value)}
    @@today << self 
  end 
  
  def self.today
    self.scrape_films
     # puts <<-DOC.gsub /^\s*/, ''
   # DOC
  end
  
  def self.scrape_films
    page = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
    top_films = []
    base_path = 'https://www.rottentomatoes.com'
    film_url = page.css(".movie_list#Top-Box-Office a").attr("href").value 
    
    page.css(".movie_list#Top-Box-Office").each do |film|
       title = page.css(".movie_list#Top-Box-Office a").attr("href").value.gsub("/m/", '')
       review_rating = page.css("#Top-Box-Office span.tMeterScore").first.text
       url = (base_path + "#{film_url}")
       
       film_info = {:title => title, 
                    :review_rating => review_rating, 
                    :url => url} 
       top_films << film_info 
      end 
     top_films 
  end
  
  def self.scrape_film_page
    page = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
    base_path = 'https://www.rottentomatoes.com'
    film_url = page.css(".movie_list#Top-Box-Office a").attr("href").value 
    url = (base_path + "#{film_url}")
    page_two = Nokogiri::HTML(open("#{url}"))
    
    title = page_two.css("h2.panel-heading")[0].text.gsub(" Videos", '')
    review_rating = page_two.css("span.meter-value").first.text
    film_synopsis = page_two.css("div#movieSynopsis").text.gsub("\n", '').strip
    film_rating = page_two.css("div.meta-value").first.text
    genre = page_two.css("div.meta-value")[1].text.gsub("\n", '').split.join(" ")
    director = page_two.css("div.meta-value")[2].text.gsub("\n", '').strip
    
    
    binding.pry
  end
  
end
    
  
  
  
