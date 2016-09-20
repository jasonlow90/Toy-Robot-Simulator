# require ("./map.rb")
class Robot
  def initialize

  end

  def place(x, y, direction)

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
