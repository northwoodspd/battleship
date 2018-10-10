class SeanBotPlayer 
  def initialize
    @plays = 10.times.map { |x| 10.times.map { |y| [x, y] } }.flatten(1)
  end

  def name
    "Sean's Kinda Random Bot, I Guess?"
  end

  def new_game
    [
      [rand(6), 0, 5, :across],
      [rand(7), 1, 4, :across],
      [rand(8), 2, 3, :across],
      [rand(8), 3, 3, :across],
      [rand(9), 4, 2, :across]
    ]
  end

  def take_turn(state, ships_remaining)
    @plays.delete_at(rand(@plays.length))
  end
end
