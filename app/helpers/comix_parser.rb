class ComixParser

  SUBSECTIONS = ['DARK HORSE COMICS', 'DC COMICS','IDW PUBLISHING','IMAGE COMICS','MARVEL COMICS','COMICS','MAGAZINES','MERCHANDISE']

  attr_reader :shipping_date, :subsections, :comix

  def initialize(data)
    @data = data
    @subsections = []
    @comix = []
  end  

  def parse
 
    @data.each_with_index { | value, index |
      #puts "Line #{index}: #{value}"
      
      @subsections << value && current_section = value if SUBSECTIONS.include?value
      
      values = value.split('\t')
      id = values[0]
      title = values[1]
      rrp = values[2]
      @comix << Comic.new(current_section, id, title, rrp)
    }  
            
    @shipping_date = DateTime.strptime(@data[2].split[1], '%m/%d/%Y')
    
  end  

end