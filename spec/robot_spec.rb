require_relative '../src/robot.rb'

describe Robot do
  before do
    @robot = Robot.new(0,0,"EAST")
  end
  describe '.new' do
    it 'Creates a new Robot object' do
      expect(@robot).to_not eq nil
    end
  end

  describe 'direction' do
    it 'Should be the direction that I created the Robot with' do
      expect(@robot.direction).to eq 'EAST'
    end
  end

  before do
    @robot.left
  end

  describe 'left' do
    it 'Should be able to turn 90 degrees left of current direction' do
      expect(@robot.direction).to eq 'SOUTH'
    end
  end

  before do
    @robot.right
  end

  describe 'right' do
    it 'Should be able to turn 90 degrees right of current direction' do
      expect(@robot.direction).to eq 'EAST'
    end
  end

  # describe 'report' do
  #   it 'Should return the current location and direction of robot' do
  #     expect(robot.report).to eq "OUTPUT: #{robot.x}, #{robot.y}, #{robot.direction}"
  #   end
  # end

end
