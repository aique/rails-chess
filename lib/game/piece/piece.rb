class Piece

    attr_reader :color
    attr_accessor :square, :board
    
    protected def initialize(color)
        @color = color
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
            @square.piece = nil
            @first_movement = false

            @square = square
            @square.piece = self

            return self
        end

        raise "Invalid movement"
    end

    protected def capture_available?(square)
        !square.piece.nil? && square.piece.color != @color
    end

    protected def empty_or_capturable?(square)
        square.piece.nil? || (!square.piece.nil? && square.piece.color != @color)
    end

    protected def available_square?(square)
        raise "Method must be overwritten"
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