class ReleasesController < ApplicationController
  
  before_filter :init_scraper
  
  def new
    data = @scraper.get_new_releases
    @parser = Kapow::ComixParser.new(data) 
    @parser.parse     
    @releases = @parser.comix
    @shipping_date = @parser.shipping_date
  end

  def upcoming
    data = @scraper.get_upcoming_releases
    @parser = Kapow::ComixParser.new(data) 
    @parser.parse     
    @releases = @parser.comix
    @shipping_date = @parser.shipping_date    
  end
  
  private
  
  def init_scraper
    @scraper = Kapow::ComixScraper.new('http://www.previewsworld.com/')
  end
  
end
