require_relative '../sean_bot_player.rb'
describe SeanBotPlayer do
  subject { SeanBotPlayer.new }

  describe '#new_game' do
    subject { super().new_game }

    it 'returns 5 ships' do
      expect(subject.length).to be 5
    end

    it 'returns the correct length ships' do
      lengths = subject.map{ |x| x[2] }
      expect(lengths).to match_array [2, 3, 3, 4, 5]
    end
  end

  describe '#add_ship' do
    it 'returns the ship structure' do
      allow(subject).to receive(:rand).and_return 2

      expect(subject.add_ship(2, :down)).to eq [2, 0, 2, :down]
    end

    it 'removes cells from the board model' do
      subject.add_ship(5, :across)

      expect(subject.open_spaces.length).to be 95
    end

    it 'uses a random top-left starting point' do
      allow(subject).to receive(:rand).and_return 7

      expect(subject.add_ship(2, :down)).to eq [7, 0, 2, :down]
    end

    it 'keeps selecting locations until one will not go off the bottom of the board' do
      allow(subject).to receive(:rand).and_return(99, 99, 0)

      expect(subject.add_ship(2, :down)).to eq [0, 0, 2, :down]
    end

    it 'keeps selecting locations until one will not go off the edge of the board' do
      allow(subject).to receive(:rand).and_return(9, 19, 0)

      expect(subject.add_ship(2, :across)).to eq [0, 0, 2, :across]
    end

    it 'keeps selecting locations until it does not overlap with other ships' do
      allow(subject).to receive(:rand).and_return(1, 0, 0, 6)

      subject.add_ship(5, :across) # 5 long at [1, 0]
      final_coords = subject.add_ship(4, :across) # 4 long at [0, 0], [0, 0], then [1, 1]
                                                  # (not [6, 0], because those cells are removed)

      expect(final_coords).to eq [1, 1, 4, :across]
    end
  end
end
