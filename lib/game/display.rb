class Display

    def show(game)
        system "clear"
        show_board(game.board)
    end

    private def show_board(board)
        board.squares.each do |row|
            row.each do |square|
                print " #{square.piece ? square.piece : square} "
            end

            print "\n"
        end

        print "\n"
    end

    def ask_to_move(player)
        puts "Please #{player.name}, make your movement"
        gets.chomp
    end

end