class Interface
  VALID_COMMANDS = ['PLACE', 'MOVE', 'LEFT', 'RIGHT', 'REPORT', 'EXIT']

  def initialize(map = Map.new, robot = Robot.new)
    @map = map
    @robot = robot
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
    puts "EXIT - close the program"
  end

  def get_user_command
    input_list = gets.chomp.split(' ')

    sanitize_input(input_list)
  end

  def run_user_command(command_list)
    until command_list.empty?
      command = command_list.shift

    end
  end

  def sanitize_input(input_list)
    input_list.drop_while { |input| input != 'PLACE' }
  end

  def input_valid?(input)
    VALID_COMMANDS.include?(input)
  end
end