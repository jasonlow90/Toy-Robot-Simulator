require_relative '../src/interface'
require_relative '../src/map'
require_relative '../src/robot'

describe Interface do
  describe 'print_welcome_message' do
    subject { Interface.new }
    let(:welcome_message) do
      "Welcome to Toy Robot Game\nThe table has a grid size of 5 x 5\nChoose an option: (case insensitive)\n\nPLACE x,y,direction - Place the robot on the table\nPlease enter a number within 0 - 4 for both x and y axis to place the robot on the table\nPlease choose the facing direction of the robot. (EAST, NORTH, WEST, SOUTH)"
    end

    it 'should display the welcome messages' do
      expect{subject}.to output(welcome_message).to_stdout
    end
  end
end