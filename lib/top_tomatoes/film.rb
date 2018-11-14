require 'pry'

class TopTomatoes::Film 
  attr_accessor :title, :review_rating, :film_website, :film_synopsis, :genre, :film_rating, :director

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    TopTomatoes::Scraper.scrape_top_films_list
  end 
  
end
    
  
  
  
