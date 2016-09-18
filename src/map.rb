# require("./robot.rb")

class Map
  attr_accessor :grid_size, :origin

  def initialize
    @grid_size = [4, 4]
    # if origin.first > @grid_size.first || origin.last > @grid_size.last
    #   return puts "You can't place the robot out of the table size."
    # end
  end

  # def position(x, y)
  #   puts @grid_size.last
  #   if x > @grid_size.first || y > @grid_size.last
  #     return puts "You can't place the robot out of the table size."
  #   end
  # end

end

hello = Map.new
puts hello.grid_size
