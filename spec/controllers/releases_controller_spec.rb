require 'spec_helper'

describe ReleasesController do

  describe "GET 'new'" do
    
    before :each do
      init_mocks
      @scraper.should_receive(:get_new_releases).and_return @release_data

      get 'new'
    end
    
    it "returns http success" do
      response.should be_success
    end
    
    it "should render the new template" do
      response.should render_template("new")
    end   
    
    it 'has the list of new releases' do    
      assigns(:releases).should_not be_nil
      assigns(:shipping_date).should_not be_nil
    end 
  end

  describe "GET 'upcoming'" do
    
    before :each do
      init_mocks
      @scraper.should_receive(:get_upcoming_releases).and_return @release_data
            
      get 'upcoming'
    end    
    
    it "returns http success" do
      response.should be_success
    end
    
    it "should render the upcoming template" do
      response.should render_template("upcoming")
    end  
    
    it 'has the list of upcoming releases' do
      assigns(:releases).should_not be_nil
      assigns(:shipping_date).should_not be_nil
    end      
  end
  
  def init_mocks
    @scraper = mock(ComixScraper::Scraper)
    ComixScraper::Scraper.should_receive(:new).and_return(@scraper)
    
    @release_data = mock(ComixScraper::ReleaseData)
    @release_data.should_receive(:comix).and_return [mock(ComixScraper::Comic)]
    @release_data.should_receive(:shipping_date).and_return DateTime.now
  end

end
