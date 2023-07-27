class Display

    def show(game)
        show_board(game.board)
    end

    private def show_board(board)
        board.squares.each do |row|
            row.each do |square|
                print " #{square.piece ? square.piece : square} "
            end

            print "\n"
        end
    end

end