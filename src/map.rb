class Map
  attr_reader :grid_length, :grid_width

  def initialize(width = 5, length = 5)
    @grid_length = width - 1
    @grid_width = length -1
  end
end
