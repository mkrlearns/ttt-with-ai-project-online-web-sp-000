module Players
  class Computer < Player
    def move(board)
      Game::WIN_COMBINATIONS.each do |combo|
        progress = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
        if progress.count("X") == 2 || progress.count("O") == 2
          combo.each do |cell|
            return cell + 1 if !board.taken?(cell + 1)
          end
        end
      end
      [5,1,3,7,9,2,4,6,8].each do |cell|
        return cell.to_s if !board.taken?(cell)
      end
    end
  end
end
