require_relative 'board'
require_relative 'player'
require_relative 'display'

class Game

    BLACK = "black"
    WHITE = "white"

    attr_reader :board
    
    def initialize(board, display)
        @board = board
        @display = display
        @players = []
    end

    def append_player(player)
        @players << player
    end

    def start
        @board.set_up_pieces
        active_player_index = 0

        loop do
            @display.show(self)
            active_player = @players[active_player_index]
            move = @display.ask_to_move(active_player)

            active_player_index = (active_player_index + 1) % @players.length

            break if false
        end
    end

end