require 'pry'

class TopTomatoes::CLI

  def call 
    puts "Welcome! Here are today's top box office films:"
    list_films
  end
  
  def list_films 
    TopTomatoes::Scraper.scrape_top_films
    TopTomatoes::Film.all.each.with_index(1) do |film, i| 
      puts "#{i}. #{film.title} - #{film.review_rating} - #{film.box_office_revenue}"
    end
      input = gets.strip.to_i - 1  
      film = TopTomatoes::Film.all[input] 
      TopTomatoes::Scraper.scrape_film(film) 
      puts film.description 
      puts film.genre
    
   
  end
  
 

 
end