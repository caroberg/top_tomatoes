require 'pry'

class TopTomatoes::Film 
  attr_accessor :title, :url_name, :film_url, :review_rating, :box_office_revenue, :description, :director, :genre, :film_rating
  @@all = [] 
  
  def initialize(title, review_rating, box_office_revenue, film_url)
    @title = title 
    @review_rating = review_rating 
    @box_office_revenue = box_office_revenue 
    @film_url = film_url 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end
  
end