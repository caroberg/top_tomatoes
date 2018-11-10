require 'pry'

class TopTomatoes::Film 
  attr_accessor :title, :review_rating, :film_url, :genre, :film_rating, :director, :plot_summary, :trailer
  
  def self.today 
    self.scrape_films
   # puts <<-DOC.gsub /^\s*/, ''
   # DOC
  end 
  
  def self.scrape_films 
    films = [] 
    films << self.scrape_list 
    films 
  end 
  
  def self.scrape_list 
    page = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
    
    binding.pry 
    
  end
  
end