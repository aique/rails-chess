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
        if empty_square?
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

    private def empty_square?
        return @square.nil?
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

        for i in 1..num_squares
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

        return false
    end

end