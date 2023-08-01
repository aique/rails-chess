require_relative 'board'
require_relative 'player'
require_relative 'display'
require_relative 'referee'
require_relative 'movement/parser'
require_relative 'movement/movement'

class Game

    BLACK = "black"
    WHITE = "white"

    attr_reader :board
    
    def initialize(board, referee, parser, display)
        @board = board
        @referee = referee
        @display = display
        @parser = parser
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

            loop do
                input = @display.ask_to_move(active_player)
                move = @parser.parse_movement(input, @board)
                break unless move.nil?
            end

            active_player_index = (active_player_index + 1) % @players.length

            break if false
        end
    end

end