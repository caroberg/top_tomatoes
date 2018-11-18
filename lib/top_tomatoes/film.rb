require 'pry'

class TopTomatoes::Film 
  attr_accessor :title, :percentage, :box_office_revenue, :url, :genre, :director, :film_rating, :release_date, :film_summary, :film_url, :doc
  
  @@all = []
  
  def initialize(title=nil, percentage=nil, box_office_revenue=nil, url=nil) 
    @title = title 
    @percentage = percentage 
    @box_office_revenue = box_office_revenue 
    @url = url 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.find(id) 
    self.all[id-1] 
  end 
  
  def film_summary 
    @film_summary ||=
  end
  
  def genre 
    @genre ||=
  end 
  
  def director 
    @director ||=
  end 
  
  def film_rating
    @film_rating ||=
  end 
  
  def release_date 
    @release_date ||=
  end
  
  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  
end
    
  
  
  
