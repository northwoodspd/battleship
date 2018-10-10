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
end
