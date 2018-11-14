require 'pry'

class TopTomatoes::Scraper 
  
    def self.scrape_top_films_list
      scrape_results = []
      
      website = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
      top_box_office_films = website.css("#Top-Box-Office")
      movie_collection = top_box_office_films.css("tr.sidebarInTheaterOpening")
 
      titles = movie_collection.css("td.middle_col").collect {|film| film.text.strip}
      titles.each do |title| 
        scrape_results << movie_collection.text.strip
      end
    end
  
    def self.scrape_film
      scrape_results = []
    
      website = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
      top_box_office_films = website.css("#Top-Box-Office")
      movie_collection = top_box_office_films.css("tr.sidebarInTheaterOpening").each do |row| 
        scrape_results << row
      end
      i=1 
      while i < scrape_results.count do 
        url_name = scrape_results[i].css("a").attr("href").value
        base_path = "https://www.rottentomatoes.com"
        film_website = Nokogiri::HTML(open(base_path + url_name))
        title = scrape_results[i].css("td.middle_col").text.strip
       
        review_rating = film_website.css("span.meter-value").first.text
        film_synopsis = film_website.css("div#movieSynopsis").text.gsub("\n", "").gsub("\"", "").strip
        film_rating = film_website.css("div.meta-value").first.text
        genre = film_website.css("div.meta-value")[1].text.gsub("\n", '').split.join(" ")
        director = film_website.css("div.meta-value")[2].text.gsub("\n", '').strip
        film_instance = TopTomatoes::Film.new(title, film_website)
        i+=1
       end
     end

  end
  
  
