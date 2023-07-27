class Game

    attr_reader :board
    
    def initialize(board, display)
        @board = board
        @display = display
    end

    def start
        @board.set_up_pieces
        @display.show(self)
    end

end