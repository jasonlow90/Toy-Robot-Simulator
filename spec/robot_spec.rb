require_relative '../src/robot'
require_relative '../src/map'

describe Robot do
  let(:instance) { Robot.new(Map.new) }

  describe '.new' do
    it 'Creates a new Robot object' do
      expect(instance).to be_an_instance_of(Robot)
    end
  end

  describe '#place' do
    context 'given a valid coordinate' do
      before { instance.place(0, 0, 'NORTH') }

      it 'will be placed on the map successfully' do
        expect(instance.instance_variable_get(:@x)).to eq 0
        expect(instance.instance_variable_get(:@y)).to eq 0
        expect(instance.instance_variable_get(:@direction)).to eq 'NORTH'
      end
    end

    context 'given a bad coordinate' do
      before { instance.place(5, 5, 'RUBBISH') }

      it 'will not place itself on the map' do
        expect(instance.instance_variable_get(:@x)).to eq nil
        expect(instance.instance_variable_get(:@y)).to eq nil
        expect(instance.instance_variable_get(:@direction)).to eq nil
      end
    end
  end

  describe '#move' do

  end

  describe '#left' do
    describe 'when the current direction is' do
      context 'north' do
        before do
          instance.place(0, 0, 'NORTH')
          instance.left
        end

        it 'will rotate to west' do
          expect(instance.instance_variable_get(@direction)).to eq 'WEST'
        end
      end

      context 'east' do
        before do
          instance.place(0, 0, 'EAST')
          instance.left
        end

        it 'will rotate to north' do
          expect(instance.instance_variable_get(@direction)).to eq 'NORTH'
        end
      end

      context 'south' do
        before do
          instance.place(0, 0, 'SOUTH')
          instance.left
        end

        it 'will rotate to east' do
          expect(instance.instance_variable_get(@direction)).to eq 'EAST'
        end
      end

      context 'west' do
        before do
          instance.place(0, 0, 'WEST')
          instance.left
        end

        it 'will rotate to south' do
          expect(instance.instance_variable_get(@direction)).to eq 'SOUTH'
        end
      end
    end
  end

  describe '#right' do
    describe 'when the current direction is' do
      context 'north' do
        before do
          instance.place(0, 0, 'NORTH')
          instance.right
        end

        it 'will rotate to east' do
          expect(instance.instance_variable_get(@direction)).to eq 'EAST'
        end
      end

      context 'east' do
        before do
          instance.place(0, 0, 'EAST')
          instance.right
        end

        it 'will rotate to south' do
          expect(instance.instance_variable_get(@direction)).to eq 'SOUTH'
        end
      end

      context 'south' do
        before do
          instance.place(0, 0, 'SOUTH')
          instance.right
        end

        it 'will rotate to west' do
          expect(instance.instance_variable_get(@direction)).to eq 'WEST'
        end
      end

      context 'west' do
        before do
          instance.place(0, 0, 'WEST')
          instance.right
        end

        it 'will rotate to north' do
          expect(instance.instance_variable_get(@direction)).to eq 'NORTH'
        end
      end
    end
  end

  describe '#report' do
    context 'when placed on a map' do
      before { instance.place(0, 0, 'WEST') }

      it 'will announce its current location and direction' do
        expect{instance.report}.to output(/OUTPUT: 0, 0, WEST/).to_stdout
      end
    end

    context 'when not placed on a map' do
      it 'will ignore the command' do
        expect{instance.report}.to_not output.to_stdout
      end
    end
  end
end
