module Players
  class Computer < Player

    def move(board)
      opponent = self.token == "X" ? "O" : "X"
      Game::WIN_COMBINATIONS.each do |combo|
        progress = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
        if progress.count(opponent) == 2
          combo.each do |cell|
            if board.cells[cell] == " "
              return cell + 1
            end
          end
        end
      end
      ['5','1','3','7','9','2','4','6','8'].each do |cell|
        if board.cells[cell.to_i - 1] == " "
          puts cell
          return cell
        end
      end
    end
  end
end