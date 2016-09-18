require("./map.rb")
require("./robot.rb")

# include Robot, Map
puts "Please insert command"
loop do
  task = gets.chomp.upcase.split(" ")
  case task.first
  when "PLACE"
    details = task.last.split(",")
    # puts "this is #{details}"
    # puts (details[1].to_i.is_a?(Integer))
    map = Map.new
    puts map.grid_size
    puts details[0].to_i
    if (details[0].to_i > map.grid_size[0] || details[1].to_i > map.grid_size[1])
      puts "please choose again"
    else
      robot = Robot.new(details.first.to_i, details[1].to_i, details.last)
      # puts map.position
      puts robot.report
      puts "Robot has been made. please tell me the next step"
      loop do
        task2 = gets.chomp.upcase
        case task2
        when "MOVE"
          if robot.valid_move?(map.grid_size)
            puts "You are at the edge of the table! Please type REPORT to check your current location!"
          else
            robot.move
            puts "Robot has just moved one step forward towards #{robot.direction}!"
          end
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
          puts "Sorry, command not found.Please input a valid command."
        end
      end
    end
  when "EXIT"
    break
  else
    puts "You have not place your robot on the table yet. Please input PLACE to place your robot on the table or type EXIT to quit the program."
  end
end
