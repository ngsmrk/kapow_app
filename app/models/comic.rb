class Comic
  
  attr_reader :publisher, :id, :title, :rrp
  
  def initialize(publisher, id, title, rrp)
    @publisher = publisher
    @id = id
    @title = title
    @rrp = rrp        
  end
  
  def to_s
    puts "Comic: #{@title}"
  end
  
  def == (other)
    other.id == self.id && other.title == self.title && other.rrp == self.rrp
  end
  
end