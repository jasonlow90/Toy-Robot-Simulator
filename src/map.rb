# require("./robot.rb")

class Map
  attr_accessor :grid_size, :list_of_directions

  def initialize
    @grid_size = [4, 4]
    @list_of_directions = ["EAST", "NORTH", "SOUTH", "WEST"]
  end

  def valid_direction?(direction)
    @list_of_directions.each do |face|
      if face == direction
        return true
      end
    end
    return false
  end


end
