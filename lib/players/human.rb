module Players
  class Human < Player
    def move(board)
      if board.turn_count == 0
        board.display_key
      else
        board.display
      end
      puts "\nPlayer #{self.token}, choose 1-9:"
      gets
    end
  end
end