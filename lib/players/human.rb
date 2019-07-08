module Players
  class Human < Player
    def move(board)
      board.turn_count == 0 ? board.display_key : board.display
      puts "\nPlayer #{self.token}, choose 1-9:"
      gets
    end
  end
end