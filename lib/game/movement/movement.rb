class Movement

    attr_reader :piece, :square
    
    def initialize(piece, square)
        @piece = piece
        @square = square
    end

    def valid?(player)
        @piece.player == player && @piece.available_square?(@square)
    end
    
end