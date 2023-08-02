class Display

    def show(game)
        system "clear"
        show_board(game.board)
        show_players(game)
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

    private def show_players(game)
        white_player = game.get_player(Game::WHITE)
        black_player = game.get_player(Game::BLACK)
        
        print player_data(white_player)
        print player_data(black_player)
    end

    private def player_data(player)
        data = "#{player.name} #{player.color}\n"
        data = data + "#{get_captures(player)}\n"

        data
    end

    private def get_captures(player)
        captures = "Captures: "

        player.captures.each do |capture|
            captures = captures + capture.to_s
        end

        captures = captures + "\n"
    end

    def ask_to_move(player)
        puts "Please #{player.name}, make your movement"
        gets.chomp
    end

    def invalid_movement
        puts "You should enter a valid movement"
    end

    def show_winner(player)
        puts "#{player.name} wins 🎉"
    end

end