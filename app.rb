require("./src/map.rb")
require("./src/robot.rb")

puts "Welcome to Toy Robot Game"
puts "The table has a grid size of 5 x 5"
puts "Choose an option: (case insensitive)"
puts ""
puts "PLACE x,y,direction - Place the robot on the table"
puts "Please enter a number within 0 - 4 for both x and y axis to place the robot on the table"
puts "Please choose the facing direction of the robot. (EAST, NORTH, WEST, SOUTH)"
puts "EXIT - close the program"
puts ""
loop do
  task = gets.chomp.upcase.split(" ")
  case task.first
  when "PLACE"
    details = task.last.split(",")
    map = Map.new
    puts details.last
    puts ""
    if (details.first.to_i > map.grid_size.first || details[1].to_i > map.grid_size[1])
      puts "You cannot place the robot outside of the table. *This is a 5 x 5 table*"
    elsif !(map.valid_direction?(details.last))
      puts "Please input a valid direction."
    else
      robot = Robot.new(details.first.to_i, details[1].to_i, details.last)
      puts "Robot has been placed on the table. Please state the next command."
      puts "PLACE - Relocate the robot on the table"
      puts "MOVE - Move one step forward"
      puts "LEFT - Turn 90 degree left"
      puts "RIGHT - Turn 90 degree right"
      puts "REPORT - Shows the x-axis, y-axis and facing direction of the robot."
      puts "EXIT - Remove the robot from the table"
      loop do
        task_2 = gets.chomp.upcase
        case task_2
        when "MOVE"
          if robot.valid_move?(map.grid_size)
            puts "You are at the edge of the table! Please type REPORT to check your current location!"
          else
            robot.move
            puts "Robot has just moved one step forward towards #{robot.direction}!"
          end
        # when "PLACE"
        #   p task_2.split(" ")
        when "LEFT"
          robot.left
          puts "Robot is currently facing #{robot.direction}"
        when "RIGHT"
          robot.right
          puts "Robot is currently facing #{robot.direction}"
        when "REPORT"
          robot.report
        when "EXIT"
          puts "The robot is no longer on the table"
          break
        else
          puts "Sorry, command not found. Please input a valid command."
        end
      end
    end
  when "EXIT"
    break
  else
    puts "You have not place your robot on the table yet. Please input PLACE to place your robot on the table or type EXIT to quit the program."
  end
end
