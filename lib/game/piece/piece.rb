class Piece

    PAWN = "pawn"
    ROOK = "rook"
    KNIGHT = "knight"
    BISHOP = "bishop"
    QUEEN = "queen"
    KING = "king"

    attr_reader :color, :player
    attr_accessor :square, :board
    
    protected def initialize(color, player = nil)
        @color = color
        @player = player
        @board = nil
        @square = nil
        @first_movement = true
    end

    def square=(square)
        if @square.nil?
            @square = square
            @square.piece = self
            
            return self
        end

        if available_square?(square)
            @player.append_capture(square.piece) unless @player.nil? || square.piece.nil?

            @square.piece = nil
            @first_movement = false

            @square = square
            @square.piece = self

            return self
        end

        raise "Invalid movement"
    end

    def available_square?(square)
        raise "Method must be overwritten"
    end

    protected def capture_available?(square)
        !square.piece.nil? && square.piece.color != @color
    end

    protected def empty_or_capturable?(square)
        square.piece.nil? || (!square.piece.nil? && square.piece.color != @color)
    end

    protected def obstruction?(square)
        rows = square.row - @square.row
        columns = square.column - @square.column
        num_squares = [rows.abs, columns.abs].max

        next_row = @square.row
        next_column = @square.column

        for i in 1..(num_squares - 1)
            if rows > 0
                next_row = @square.row + i
            elsif rows < 0
                next_row = @square.row - i
            end

            if columns > 0
                next_column = @square.column + i
            elsif columns < 0
                next_column = @square.column - i
            end

            unless @board.get_piece(next_row, next_column).nil?
                return true
            end
        end

        false
    end

    protected def diagonal_movement?(square)
        (square.row - @square.row).abs == (square.column - @square.column).abs
    end

    protected def lineal_movement?(square)
        square.row == @square.row || square.column == @square.column
    end

end