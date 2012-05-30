class ComixParser

  SUBSECTIONS = ['DARK HORSE COMICS', 'DC COMICS','IDW PUBLISHING','IMAGE COMICS','MARVEL COMICS','COMICS','MAGAZINES','MERCHANDISE']

  attr_reader :shipping_date, :subsections

  def initialize(data)
    @data = data
    @subsections = []
  end  

  def parse

    @data.each_with_index { | value, index |
      puts "Line #{index}: #{value}"
      
      @subsections << value if SUBSECTIONS.include?value
    }   
            
    @shipping_date = DateTime.strptime(@data[2].split[1], '%m/%d/%Y')
    
  end  

end