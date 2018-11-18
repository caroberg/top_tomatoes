require 'pry'

class TopTomatoes::CLI

  def call
    TopTomatoes::Scraper.new.make_films
    puts "Welcome! Here are today's top box office films:"
    list_films
    menu
  end
  
  def list_films
  
    puts "Today's top films in a theater near you:"
    @films = TopTomatoes::Film.all
    @films.each.with_index(1) do |film, i| 
      puts "#{i}. #{film.title} - #{film.review_rating} - #{film.box_office_revenue}"
    end
    
    
  end
  
  
  
  
  def menu
    
  input = nil 
    while input != "exit"
      puts "Enter the number of the film you would like more information on or type 'list' to see the list again or type 'exit'." 
      input = gets.strip.downcase 
      if input.to_i > 0 
       film = TopTomatoes::Film.find(input.to_i)
       print_film(film)
      elsif input == "list"
        list_films 
      else 
        puts "Not sure what you want. Please type 'list' or 'exit'."
      end 
    end 
    
    def print_film(film)
      
    end
  end

    restaurant = WorldsBestRestaurants::Restaurant.find(input.to_i)

    print_restaurant(restaurant)

    puts ""
    puts "Would you like to see another restaurant? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you! Have a great day!"
      exit
    else
      puts ""
      puts "I don't understand that answer."
      start
    end
  end

 

