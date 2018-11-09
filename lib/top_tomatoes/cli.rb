class TopTomatoes::CLI 
  
  def call 
    list_films 
    menu
    farewell
  end 
  
  def list_films 
    puts "Today's top films in a theater near you:"
    @films = TopTomatoes::Film.today
  end
  
  def menu 
    input = nil 
    while input != "exit"
      puts "Enter the number of the film you would like more information on or type 'list' to see the list again or type 'exit'." 
      input = gets.strip.downcase 
      if input.to_i > 0 
        puts @films[input.to_i-1]
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