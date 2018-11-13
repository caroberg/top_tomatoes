require 'pry'

class TopTomatoes::Scraper 
  website = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
  top_box_office_films = website.css("#Top-Box-Office")
  
  
  movie_collection = top_box_office_films.css("tr.sidebarInTheaterOpening").collect do |movie|
    
    
  
  movie_hash = {
    :title => movie.css("td.middle_col").text.strip
  }
  
  
  end
  binding.pry
  
  
  
  
end