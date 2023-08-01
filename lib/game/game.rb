require_relative 'board'
require_relative 'player'
require_relative 'display'
require_relative 'referee'

class Game

    BLACK = "black"
    WHITE = "white"

    attr_reader :board
    
    def initialize(board, referee, display)
        @board = board
        @referee = referee
        @display = display
        @players = []
    end

    def append_player(player)
        @players << player
    end

    def start
        @referee.set_up_pieces(@board)
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