class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    ["X", "O"].each do |player|
      WIN_COMBINATIONS.each do |combo|
        if combo.all? { |combo| board.cells[combo] == player }
          return combo
        end
      end
    end
    return nil
  end

  def full?
    board.cells.all? { |cell| cell == "X" || cell == "O" }
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || full? || draw?
  end
  
  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    if board.turn_count == 0
      board.display_key
    else
      board.display
    end
    puts "\nPlayer #{current_player.token}, choose 1-9:"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      system "clear"
    else
      system "clear"
      puts "Invalid selection, try again."
      turn
    end
  end

  def play
    turn until over?
    board.display
    if won?
      puts ""
      puts "Congratulations #{winner}!"
      puts ""
    elsif draw?
      puts ""
      puts "Cat's Game!"
      puts ""
    end
  end

  def wargames
    wins = 0
    draws = 0
    100.times do
      turn until over?
      wins = won? ? wins + 1 : wins
      draws = draw? ? draws + 1 : draws
    end
    system "clear"
    puts "Greetings Professor Falken."
    puts ""
    puts "In 100 matches of CPU vs CPU there were:"
    puts "#{wins} wins and #{draws} draws."
    puts ""
    puts "A Strange Game."
    puts "The only winning move"
    puts "is not to play."
    puts ""
  end
end