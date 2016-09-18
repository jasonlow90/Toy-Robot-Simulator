# require ("./map.rb")
class Robot
  attr_accessor :dx, :dy, :direction, :all

  def initialize(dx, dy, direction)
    @dx = dx
    @dy = dy
    @direction = direction.to_sym
    @all = [
    [:EAST,  +1,  0],
    [:NORTH,  0, +1],
    [:WEST,  -1,  0],
    [:SOUTH,  0, -1],
  ]
  end

  def move
    @all.each do |face|
      if face.first == @direction
        @dx = @dx + face[1]
        @dy = @dy + face[2]
      end
    end

  end

  def left
    @all.each_with_index do |face, index|
      if face.first == @direction
       return @direction = @all[(index + 1) % @all.length].first
      end
    end
  end

  def right
    @all.each_with_index do |face, index|
      if face.first == @direction
        return @direction = @all[(index - 1) % @all.length].first
      end
    end
  end

  def report
    puts "#{@dx}, #{@dy}, #{@direction}"
  end

end

robot = Robot.new(0, 0, "EAST")
