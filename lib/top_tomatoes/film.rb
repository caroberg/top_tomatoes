require 'pry'

class TopTomatoes::Film 
  attr_accessor :title, :review_rating, :film_url, :genre, :film_rating, :director, :plot_summary, :trailer
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
       
       binding.pry 
      end 
     top_films 
  end
    
  
  
  
