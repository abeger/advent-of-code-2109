# frozen_string_literal: true

RSpec.describe MonitoringStation::Asteroid do
  describe '#direction' do
    it 'calculates direction to another asteroid' do
      a1 = described_class.new(3, 4)
      a2 = described_class.new(4, 5)
      expect(a1.direction(a2)).to eq(45)
    end

    it 'calculates negative direction to another asteroid' do
      a1 = described_class.new(3, 4)
      a2 = described_class.new(2, 3)
      expect(a1.direction(a2)).to eq(225)
    end

    it 'finds asteroid to the north' do
      a1 = described_class.new(3, 4)
      a2 = described_class.new(3, 5)
      expect(a1.direction(a2)).to eq(0)
    end

    it 'finds asteroid to the south' do
      a1 = described_class.new(3, 4)
      a2 = described_class.new(3, 2)
      expect(a1.direction(a2)).to eq(180)
    end

    it 'finds asteroid to the east' do
      a1 = described_class.new(3, 4)
      a2 = described_class.new(5, 4)
      expect(a1.direction(a2)).to eq(90)
    end

    it 'finds asteroid to the west' do
      a1 = described_class.new(3, 4)
      a2 = described_class.new(1, 4)
      expect(a1.direction(a2)).to eq(270)
    end
  end

  describe '#distance' do
    it 'calculates distance to another asteroid' do
      a1 = described_class.new(0, 0)
      a2 = described_class.new(3, 4)
      expect(a1.distance(a2)).to eq(5)
    end
  end

  describe '#visible_asteroids' do
    let(:asteroid_list) do
      [
        MonitoringStation::Asteroid.new(1, 0),
        MonitoringStation::Asteroid.new(4, 0),
        MonitoringStation::Asteroid.new(0, 2),
        MonitoringStation::Asteroid.new(1, 2),
        MonitoringStation::Asteroid.new(2, 2),
        MonitoringStation::Asteroid.new(3, 2),
        MonitoringStation::Asteroid.new(4, 2),
        MonitoringStation::Asteroid.new(4, 3),
        MonitoringStation::Asteroid.new(3, 4),
        MonitoringStation::Asteroid.new(4, 4)
      ]
    end

    it 'calculates the correct number' do
      asteroid_list.each do |a1|
        asteroid_list.each do |a2|
          a1.add_asteroid(a2)
        end
      end
      expect(asteroid_list.map(&:visible_asteroids)).to match_array([7, 7, 6, 7, 7, 7, 5, 7, 8, 7])
    end
  end
end
