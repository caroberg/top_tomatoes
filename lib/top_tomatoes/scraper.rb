require 'pry'

class TopTomatoes::Scraper 
  
  website = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
  top_box_office_films = website.css("#Top-Box-Office")
  movie_collection = top_box_office_films.css("tr.sidebarInTheaterOpening")
  
    
    
 
  movie_hash = {
    :title => movie_collection.css("td.middle_col").collect {|top_film| top_film.text.strip} 
    
  }
  
  binding.pry 
   
 



 
  
  
  
  
end