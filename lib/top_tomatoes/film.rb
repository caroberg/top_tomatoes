require 'pry'

class TopTomatoes::Film 
  attr_accessor :title, :review_rating, :website, :film_website, :film_synopsis, :genre, :film_rating, :director

  @@all = []

  def initialize(title, film_website)
    @title = title
    @film_website = film_website
    @@all << self
  end

  def self.all
    TopTomatoes::Scraper.scrape_top_films_list
  end 


  
end
    
  
  
  
