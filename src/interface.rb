class Interface
  def initialize
    @map = Map.new
    @robot = Robot.new(@map)
    print_welcome_message
    @command_list = get_user_command
    run_user_command(@command_list)
  end

  private

  def print_welcome_message
    puts "Welcome to Toy Robot Game"
    puts "The table has a grid size of 5 x 5"
    puts "Choose an option: (case insensitive)"
    puts ""
    puts "PLACE x,y,direction - Place the robot on the table"
    puts "Please enter a number within 0 - 4 for both x and y axis to place the robot on the table"
    puts "Please choose the facing direction of the robot. (EAST, NORTH, WEST, SOUTH)"
    puts "PLACE x,y,direction - Place the robot on the table"
    puts "MOVE - Move one step forward"
    puts "LEFT - Turn 90 degree left"
    puts "RIGHT - Turn 90 degree right"
    puts "REPORT - Shows the x-axis, y-axis and facing direction of the robot."
  end

  def get_user_command
    STDIN.gets.chomp.split(' ')
  end

  def run_user_command(command_list)
    until command_list.empty?
      command = command_list.shift.downcase

      case command
      when 'place'
        place_options = command_list.shift.upcase
        next unless place_options =~ /\d\,\d\,(NORTH|EAST|SOUTH|WEST)/

        @robot.send(command, *place_options.split(','))
      when 'move', 'left', 'right', 'report'
        @robot.send(command)
      end
    end
  end
end
