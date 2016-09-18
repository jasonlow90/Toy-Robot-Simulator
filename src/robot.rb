require ("./map.rb")
class Robot
  attr_accessor :dx, :dy, :direction, :all

  def initialize(dx, dy, direction)
    @dx = dx
    @dy = dy
    @direction = direction
    @all = [
    [:EAST,  +1,  0],
    [:NORTH,  0, +1],
    [:WEST,  -1,  0],
    [:SOUTH,  0, -1],
  ]
  end

  def move
    @all.each do |face|
      if face[0] == @direction
        @dx = @dx + face[1]
        @dy = @dy + face[2]
      end
    end

  end

  def left
    @all.each_with_index do |face, index|
      if face[0] == @direction
        puts index
       @direction = @all[index - 1][0]
      end
    end
  end

  def right
    @all.each_with_index do |face, index|
      # puts "#{face} #{index}"
      if face[0] == @direction
        puts index
       return @direction = @all[index + 1][0]
      end
    end
  end

  def report
    puts "#{@dx}, #{@dy}, #{@direction}"
  end



end
hello = Robot.new 0,0, :NORTH
puts hello.report
hello.right
hello.move
hello.report
hello.left
hello.move
hello.report
# hello.move
# puts hello.report
