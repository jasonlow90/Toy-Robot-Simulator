require_relative '../src/map.rb'

describe Map do
  let (:map) { Map.new }
  describe '.new' do
    it 'Creates a new Map object' do
      expect(map).to_not eq nil
    end
  end

  describe 'grid_size' do
    it 'Should be the 5 x 5' do
      expect(map.grid_size).to eq [4,4]
    end
  end

  describe 'valid_direction' do
    it 'Should be the reject the direction that is not within the scope' do
      expect(map.valid_direction?("NOTEAST")).to eq false
    end
  end

end
