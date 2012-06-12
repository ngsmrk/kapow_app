require 'spec_helper'

describe ReleasesController do

  describe "GET 'new'" do
    
    before :each do
      @scraper = mock(Kapow::ComixScraper)
      @scraper.should_receive(:get_new_releases).and_return []      
      Kapow::ComixScraper.should_receive(:new).with(an_instance_of(String)).and_return(@scraper)

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
    end 
  end

  describe "GET 'upcoming'" do
    
    before :each do
      @scraper = mock(Kapow::ComixScraper)
      @scraper.should_receive(:get_upcoming_releases).and_return []      
      Kapow::ComixScraper.should_receive(:new).with(an_instance_of(String)).and_return(@scraper)
            
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
    end      
  end

end
