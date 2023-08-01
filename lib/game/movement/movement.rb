class Movement

    attr_reader :piece, :square
    
    def initialize(piece, square)
        @piece = piece
        @square = square
    end
    
end