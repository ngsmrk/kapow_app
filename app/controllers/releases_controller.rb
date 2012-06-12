class ReleasesController < ApplicationController
  
  before_filter :init_scraper
  
  def new
    @releases = @scraper.get_new_releases  
  end

  def upcoming
    @releases = @scraper.get_upcoming_releases
  end
  
  private
  
  def init_scraper
    @scraper = Kapow::ComixScraper.new('http://www.previewsworld.com/')
  end
  
end
