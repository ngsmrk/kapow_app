class ComixScraper
    include HTTParty

    def initialize(base_uri)
      @base_uri = base_uri
    end
    
    def get_new_releases
      get_data("http://www.previewsworld.com/shipping/newreleases.txt")
    end    
    
    def get_upcoming_releases
      get_data("http://www.previewsworld.com/shipping/upcomingreleases.txt")
    end   
    
    private 
    
    def get_data(url)
      data = self.class.get(url)      
      data.dump.split('\r\n')
    end 
end