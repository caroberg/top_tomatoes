require 'pry'

class TopTomatoes::CLI

  def call 
    puts "Welcome! Here are today's top box office films:"
    TopTomatoes::Scraper.scrape_top_films
    list_films
    menu
   
  end
  
  def list_films 
    TopTomatoes::Film.all.each.with_index(1) do |film, i| 
      puts "#{i}. #{film.title} - #{film.review_rating} - #{film.box_office_revenue}"
    end
  end
  
  def menu 
    input = nil 
    while input != "exit"
      puts "Please enter the number corresponding to the film you would like more information on, or type 'list' to see the list again, or type 'exit':" 
      input = gets.strip
      if input.to_i > 0
        film = TopTomatoes::Film.all[input.to_i-1] 
        TopTomatoes::Scraper.scrape_film(film) 
        puts "Title: #{film.title}" 
        puts "Critic Rating: #{film.review_rating}" 
        puts "Box Office: #{film.box_office_revenue}" 
        puts "Description: #{film.description}" 
        puts "Genre: #{film.genre}"
        puts "Director: #{film.director}" 
        puts "Rated: #{film.film_rating}"
      elsif input.downcase == "list" 
        list_films 
      elsif input.downcase == "exit"
        puts "Good-bye!"
        exit
      else 
        puts "Not sure what you're looking for."
      end 
    end
  end
  
end