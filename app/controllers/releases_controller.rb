class ReleasesController < ApplicationController
  
  before_filter :init_scraper
  
  def new
    release_data = @scraper.get_new_releases
    @releases = release_data.comix
    @shipping_date = release_data.shipping_date
  end

  def upcoming
    release_data = @scraper.get_upcoming_releases
    @releases = release_data.comix
    @shipping_date = release_data.shipping_date
  end
  
  private
  
  def init_scraper
    @scraper = ComixScraper::Scraper.new
  end
  
end
