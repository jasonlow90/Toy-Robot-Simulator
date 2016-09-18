# require ("./map.rb")
class Robot
  attr_accessor :x, :y, :direction, :all

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
    @all = [
    ["EAST",  +1,  0],
    ["NORTH",  0, +1],
    ["WEST",  -1,  0],
    ["SOUTH",  0, -1],
  ]
  end

  def move
    @all.each do |face|
      if face.first == @direction
        @x = @x + face[1]
        @y = @y + face.last
      end
    end

  end

  def left
    @all.each_with_index do |face, index|
      if face.first == @direction
        @direction = @all[(index + 1) % @all.length].first
        break
      end
    end
  end

  def right
    @all.each_with_index do |face, index|
      if face.first == @direction
        @direction = @all[(index - 1) % @all.length].first
        break
      end
    end
  end

  def report
    puts "OUTPUT: #{@x}, #{@y}, #{@direction}"
  end

  def valid_move?(grid_size)
    @all.each do |face|
      if face.first == @direction
        if (@x + face[1]) > grid_size.first || (@x + face[1]) < 0
          return true
        elsif (@y + face.last) > grid_size.first || (@y + face.last) < 0
          return true
        else
          return false
        end
      end
    end
  end


end
