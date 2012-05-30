describe 'ComixParser' do
 
  context 'when it processes new releases' do

    before :each do
      new_releases = ComixScraper.new('http://www.previewsworld.com/').get_new_releases    
      @parser = ComixParser.new(new_releases)
      @parser.parse   
    end

    it 'it can find the shipping date' do
      @parser.shipping_date.to_date.should == DateTime.now.to_date   
    end
 
  end
    
end