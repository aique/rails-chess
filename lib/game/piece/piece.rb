class Piece

    PAWN = "pawn"
    ROOK = "rook"
    KNIGHT = "knight"
    BISHOP = "bishop"
    QUEEN = "queen"
    KING = "king"

    attr_reader :color, :player
    attr_accessor :square, :board

    protected attr_reader :first_movement
    
    protected def initialize(color, player = nil)
        @color = color
        @player = player
        @board = nil
        @square = nil
        @first_movement = true
    end

    def square=(square)
        if !@square
            @square = square
            @square.piece = self
            
            return self
        end

        if available_square?(square)
            @player.append_capture(square.piece) if @player && square.piece

            @square.piece = nil
            @first_movement = false

            @square = square
            @square.piece = self

            return self
        end

        raise "Invalid movement"
    end

    def available_square?
        raise "Method must be overwritten"
    end

    protected def capture_available?(square)
        square.piece && square.piece.color != @color
    end

    protected def empty_or_capturable?(square)
        !square.piece || (square.piece && square.piece.color != @color)
    end

    protected def diagonal_movement?(square)
        (square.row - @square.row).abs == (square.column - @square.column).abs
    end

    protected def lineal_movement?(square)
        square.row == @square.row || square.column == @square.column
    end

end