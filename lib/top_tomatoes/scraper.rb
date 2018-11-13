require 'pry'

class TopTomatoes::Scraper 
  
  def scrape_top_film_list
     website = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
     top_box_office_films = website.css("#Top-Box-Office")
     movie_collection = top_box_office_films.css("tr.sidebarInTheaterOpening")
 
     film_hash = {
       :title => movie_collection.css("td.middle_col").collect {|top_film| top_film.text.strip}, 
       :review_rating => movie_collection.css("span.tMeterScore").collect {|rating| rating.text}
      }
  
     film_hash
  end

  def self.scrape_film 
  top_films_website = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
    base_path = 'https://www.rottentomatoes.com'
    film_url = top_films_website.css(".movie_list#Top-Box-Office a").attr("href").value 
    url = (base_path + "#{film_url}")
    film_website = Nokogiri::HTML(open("#{url}"))
    
    binding.pry
  end
 
  
  
  
  
end