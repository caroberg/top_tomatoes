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
    
    page.css(".movie_list#Top-Box-Office").each do |film| 
       #review_rating = page.css("span.tMeterScore").text
      
    
    binding.pry 
    
    
  end
    
    
    
    
    
    
   
    
    
    # page.css(".card-ui").each do |getaway| 
     #   title = getaway.css(".cui-udc-title-with-subtitle").text.gsub("\n", "").strip
      #  rating = getaway.css("ul.rating").first.attr("data-bhc").gsub("deal-review-rating:", "")
       # price = getaway.css(".cui-price-discount").text.gsub("From ", "").gsub("/nt", "")
      #  getaway_url = getaway.css("a").attribute("href").value 
      
    end
  
  
  
end