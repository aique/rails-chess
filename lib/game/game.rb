require_relative 'board'
require_relative 'player'
require_relative 'color'
require_relative 'display'
require_relative 'referee'
require_relative 'movement/parser'
require_relative 'movement/movement'

class Game

    WHITE = "white"
    BLACK = "black"

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

    def get_player(color)
        @players.each do |player|
            if player.color.name == color
                return player
            end
        end

        nil
    end

    def start
        white_player = get_player(Game::WHITE)
        black_player = get_player(Game::BLACK)

        @referee.set_up_pieces(
            @board, white_player, black_player
        )

        winner = nil
        active_player_index = 0

        loop do
            @display.show(self)
            active_player = @players[active_player_index]

            move = nil

            loop do
                move = ask_to_move(active_player)
                break unless move.nil?
            end

            move.piece.square = move.square
            
            if active_player.captured?(Piece::KING)
                winner = active_player
            end

            active_player_index = (active_player_index + 1) % @players.length

            break if winner
        end

        @display.show_winner(winner)
    end

    private def ask_to_move(player)
        input = @display.ask_to_move(player)
        move = @parser.parse_movement(input, @board)

        if move.valid?(player)
            return move
        end

        @display.invalid_movement

        nil
    end

end