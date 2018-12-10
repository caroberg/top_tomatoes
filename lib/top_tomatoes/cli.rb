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
      film(film)
    end
   
  end
  
  def film(film) 
    TopTomatoes::Scraper.scrape_film(film)
  end

 
end