require_relative '../src/map.rb'

describe Map do
  let(:instance) { Map.new }
  describe '.new' do
    it 'Creates a new Map object' do
      expect(instance).to be_an_instance_of(Map)
    end
  end

  describe 'can store attributes' do
    it 'has the correct grid_length' do
      expect(instance.grid_length).to eq 4
    end

    it 'has the correct grid_width' do
      expect(instance.grid_width).to eq 4
    end
  end
end
