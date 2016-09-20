require_relative '../src/interface'
require_relative '../src/map'
require_relative '../src/robot'

describe Interface do
  let(:instance) { Interface.new }
  before do
    allow(STDIN).to receive(:gets) { "PLACE 0,0,NORTH REPORT\n" }
  end

  describe 'can store attributes' do
    it 'for map' do
      expect(instance.instance_variable_get(:@map)).to be_an_instance_of(Map)
    end

    it 'for robot' do
      expect(instance.instance_variable_get(:@robot)).to be_an_instance_of(Robot)
    end

    it 'for command_list' do
      expect(instance.instance_variable_get(:@command_list)).to be_kind_of(Array)
    end
  end

  describe 'can correctly collect and execute commands' do
    context 'when given good commands' do
      before do
        allow(STDIN).to receive(:gets) { "PLACE 0,0,NORTH MOVE MOVE REPORT\n" }
      end

      it 'returns the correct location report' do
        expect{instance}.to output(/OUTPUT: 0, 2, NORTH/).to_stdout
      end
    end

    context 'when given bad commands' do
      before do
        allow(STDIN).to receive(:gets) { "MOVE MOVE HELLO PLACE 0,0,NORTH PLACE 6,7,RUBBISH MOVE MOVE REPORT\n" }
      end

      it 'returns the correct location report' do
        expect{instance}.to output(/OUTPUT: 0, 2, NORTH/).to_stdout
      end
    end
  end

  describe 'print_welcome_message' do
    let(:welcome_message) do
      /Welcome to Toy Robot Game\nThe table has a grid size of 5 x 5\nChoose an option: \(case insensitive\)\n\nPLACE x,y,direction - Place the robot on the table\nPlease enter a number within 0 - 4 for both x and y axis to place the robot on the table\nPlease choose the facing direction of the robot. \(EAST, NORTH, WEST, SOUTH\)\nPLACE x,y,direction - Place the robot on the table\nMOVE - Move one step forward\nLEFT - Turn 90 degree left\nRIGHT - Turn 90 degree right\nREPORT - Shows the x-axis, y-axis and facing direction of the robot.\n.*/
    end

    it 'should display the welcome messages' do
      expect{instance}.to output(welcome_message).to_stdout
    end
  end
end
