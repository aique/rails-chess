class Display

    def show(game)
        system "clear"
        show_board(game.board)
    end

    private def show_board(board)
        row_number = Board::HEIGHT

        board.squares.each do |row|
            print "#{row_number} "
            row_number = row_number - 1

            row.each do |square|
                print " #{square.piece ? square.piece : square} "
            end

            print "\n"
        end

        print "   a  b  c  d  e  f  g  h\n\n"
    end

    def ask_to_move(player)
        puts "Please #{player.name}, make your movement"
        gets.chomp
    end

    def invalid_movement
        puts "You should enter a valid movement"
    end

end