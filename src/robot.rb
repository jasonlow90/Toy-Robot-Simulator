class Robot
  LIST_OF_DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  def initialize(map)
    @grid_width = map.grid_width
    @grid_length = map.grid_length
    @x = nil
    @y = nil
    @direction = nil
  end

  def place(x, y, direction)
    return if will_fall?(x.to_i, y.to_i)

    @x = x.to_i
    @y = y.to_i
    @direction = direction
  end



  def will_fall?(x, y)
    x < 0 || x > @grid_width || y < 0 || y > @grid_length
  end
end
