class ComixParser

  attr_accessor :shipping_date

  def initialize(data)
    @data = data
  end  

  def parse

    @data.each_with_index { | value, index |
      puts "Line #{index}: #{value}"
    }
        
    @shipping_date = DateTime.strptime(@data[2].split[1], '%m/%d/%Y')
  end  

end