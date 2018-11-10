class TopTomatoes::CLI 
  
  def call 
    list_films 
    menu
    farewell
  end 
  
  def list_films 
    puts "Today's top films in a theater near you:"
    @films = TopTomatoes::Film.today 
    @films.each.with_index(1) do |film, i| 
      puts "#{i}. #{film.title} - #{film.review_rating}"
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
      else 
        puts "Not sure what you want. Please type 'list' or 'exit'."
      end 
    end 
  end
    
  def farewell 
    "Check back in tomorrow for the day's hottest films!"
  end
  
end