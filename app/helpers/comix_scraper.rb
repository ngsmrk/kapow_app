class ComixScraper
    include HTTParty

    def initialize(base_uri)
      @base_uri = base_uri
    end
    
    def get_new_releases
      self.class.get('http://www.previewsworld.com/shipping/newreleases.txt')
    end    
    
    def get_upcoming_releases
      self.class.get('http://www.previewsworld.com/shipping/upcomingreleases.txt')
    end    
end