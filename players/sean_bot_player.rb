class SeanBotPlayer 
  attr_accessor :open_spaces

  def initialize
    @plays = 10.times.map { |x| 10.times.map { |y| [x, y] } }.flatten(1)
    @open_spaces = 10.times.map { |y| 10.times.map { |x| [x, y] } }.flatten(1)
  end

  def name
    "Sean's Kinda Random Bot, I Guess?"
  end

  def new_game
    carrier = add_ship(5)
    titular_ship = add_ship(4)
    sub = add_ship(3)
    other_three_ship = add_ship(3)
    tiny_fucker = add_ship(2)

    [ carrier, titular_ship, sub, other_three_ship, tiny_fucker ]
  end

  def take_turn(state, ships_remaining)
    @plays.delete_at(rand(@plays.length))
  end

  def add_ship(size)
    top_left = nil
    cells = nil
    orientation = nil
    loop do
      top_left = @open_spaces[rand(@open_spaces.length)]

      orientation = [:down, :across].sample
      if (orientation == :across)
        cells = (0..size-1).map { |x| [top_left.first + x, top_left.last] }
      else
        cells = (0..size-1).map { |x| [top_left.first, top_left.last + x] }
      end

      break if cells_available?(cells)
    end

    remove_available_cells(cells)

    return top_left + [size, orientation]
  end

  def cells_available?(cells)
    (cells - @open_spaces).empty?
  end

  def remove_available_cells(cells)
    @open_spaces.reject! { |x| cells.include?(x) }
  end
end
