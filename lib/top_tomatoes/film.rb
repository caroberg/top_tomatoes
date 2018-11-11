require 'pry'

class TopTomatoes::Film 
  attr_accessor :title, :review_rating, :url, :film_synopsis, :genre, :film_rating, :director
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
  
  
end
    
  
  
  
