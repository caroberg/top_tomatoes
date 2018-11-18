require 'pry'

class TopTomatoes::Scraper 
  
    def get_page 
      Nokogiri::HTML(open("https://www.rottentomatoes.com"))
    end 
    
    def scrape_films_index 
      self.get_page.css("div#homepage-top-box-office.listings")
    end
    
    def scrape_films 
      self.scrape_films_index.css("tr.sidebarInTheaterOpening")
    end 
    
    def make_films
      scrape_films.each do |film| 
        TopTomatoes::Film.new_from_index_page(film)
      end 
    end
    
   # def scrape_films 
    #  scrape_results = []
     # films = self.scrape_films_index.css("tr.sidebarInTheaterOpening").collect {|row| row.text.strip} 
      #  films.each do |film| 
       #   scrape_results << self.scrape_films_index.text.strip
      #end
   # end
    

  end
  
  
