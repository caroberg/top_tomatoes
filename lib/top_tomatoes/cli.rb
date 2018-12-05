require 'pry'

class TopTomatoes::CLI

  def call 
    puts "Welcome! Here are today's top box office films:"
    list_films
  end
  
  def list_films 
    TopTomatoes::Scraper.scrape_top_films
  end

 
end