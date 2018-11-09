class TopTomatoes::Film 
  attr_accessor :title, :review_rating, :film_url, :genre, :film_rating, :director, :plot_summary, :trailer
  
  def self.today 
      puts <<-DOC.gsub /^\s*/, ''
      1. ...
      2. ...
      3. ...
    DOC
    film_1 = self.new 
    film_1.title = ___ 
    film_1.review_rating = ___ 
    film_1.film_url = ___
  end 
  
end