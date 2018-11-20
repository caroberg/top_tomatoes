require 'pry'

class TopTomatoes::Scraper 
  
    def self.scrape_top_films 
      scrape_results = []
      page = Nokogiri::HTML(open("https://www.rottentomatoes.com/"))
      film_table = page.css("div#homepage-top-box-office.listings") 
      film_rows = film_table.css("tr.sidebarInTheaterOpening").each do |row| 
        scrape_results << row
      end
      i=1 
      while i = scrape_results.count do 
        url_name = scrape_results[i].css("a").attr("href").value
        film_url = "https://www.rottentomatoes.com" + url_name
        title = scrape_results[i].css("td.middle_col").text.gsub("\n", "").strip
        review_rating = scrape_results[i].css(".tMeterScore").text
        box_office_revenue = scrape_results[i].css("td.right_col").text.gsub("\n", "").strip
        instance = TopTomatoes::Film.new(title, review_rating, box_office_revenue, film_url)
        i+=1 
      end
      
      
         binding.pry
      
     
    end
    
end
  
  
