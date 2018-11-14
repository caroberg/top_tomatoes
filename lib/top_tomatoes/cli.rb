require 'pry'

class TopTomatoes::CLI 
  attr_accessor :title, :review_rating, :website, :film_website, :film_synopsis, :genre, :film_rating, :director
  
  def call 
    puts "Welcome!"
    list_films 
    menu
  end

  def list_films 
    puts "Here are today's top-rated films in theaters:"
    TopTomatoes::Film.all.each.with_index(1) do |film, i|
      puts "#{i}. #{film}"
    end
  end


  def menu 
    input = nil 
    while input != "exit"
      puts "Enter the number of the film you would like more information on or type 'list' to see the list again or type 'exit'." 
      input = gets.strip.downcase
      if input.to_i > 0 
        the_film = @films[input.to_i-1]
        puts "#{film.title} - #{film.review_rating}"
      elsif input == "list"
        list_films 
      elsif input == "exit"
        puts "Come back tomorrow for a top films update!"
      else 
        puts "Not sure what you want."
        
        binding.pry
      end 
    end  
    
  end
  
end

