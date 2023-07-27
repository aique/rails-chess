class Display

    def show(game)
        show_board(game.board)
    end

    private def show_board(board)
        first_row = true

        board.squares.each do |row|
            if first_row
                row.length.times do
                    print "+---+"    
                end

                print "\n"
            end

            first_row = false

            row.each do |square|
                print "| #{square.piece ? square.piece : ' '} |"
            end

            print "\n"

            row.length.times do
                print "+---+"    
            end

            print "\n"
        end
    end

end