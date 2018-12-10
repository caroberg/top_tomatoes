require 'pry'

class TopTomatoes::Scraper 
  
    def self.scrape_top_films 
      
      page = Nokogiri::HTML(open("https://www.rottentomatoes.com/"))
      films = page.css("div#homepage-top-box-office.listings")
      film_info = films.css("tr").collect {|row| row}
    
      i=0 
      while i < film_info.count do 
        url_name = film_info[i].css("a").attr("href").value
        film_url = "https://www.rottentomatoes.com" + url_name
        title = film_info[i].css("td.middle_col").text.gsub("\n", "").strip
        review_rating = film_info[i].css(".tMeterScore").text
        box_office_revenue = film_info[i].css("td.right_col").text.gsub("\n", "").strip
        instance = TopTomatoes::Film.new(title, review_rating, box_office_revenue, film_url)
        i+=1 
       
        
      end
    
     
    end
    
    def self.scrape_film(film) 
      
       page = Nokogiri::HTML(open("https://www.rottentomatoes.com/"))
       film_info = page.css("div#homepage-top-box-office.listings tr")
       film.url_name = film_info.css("a").attr("href").value
       film.film_url = "https://www.rottentomatoes.com" + url_name
       
       doc = Nokogiri::HTML(open(film_url))
       film.title = doc.css("#movie-videos-panel h2").text.gsub(" Videos", "")
       film.review_rating = doc.css("span.meter-value")[0].text
       film.description = doc.css("div#movieSynopsis").text.gsub("\n", "").gsub("\"", "").strip
       film.director = doc.css("div.meta-value")[3].text.gsub("\n", "").strip
       film.film_rating = doc.css("div.meta-value")[0].text.gsub("\n", "").strip
       film.genre = doc.css("div.meta-value")[1].text.gsub("\n", "").split.join(" ")
       binding.pry
      
    end
    
end
  
  
