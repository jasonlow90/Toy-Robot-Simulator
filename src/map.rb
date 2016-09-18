# require("./robot.rb")

class Map
  attr_accessor :grid_size, :origin
  
  def initialize(origin)
    @grid_size = [4, 4]
    if origin[0] > @grid_size.first || origin[1] > @grid_size.last
      puts "You can't place the robot out of the table size."
    else
      @origin = origin
    end
  end

  def position(x, y)
    puts @grid_size.last
    if x > @grid_size.first || y > @grid_size.last
      return puts "You can't place the robot out of the table size."
    else
      @origin = [x, y]
    end
  end

end

map = Map.new([0, 5])
p map.origin
