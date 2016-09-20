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
end
