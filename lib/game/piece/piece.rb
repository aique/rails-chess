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
            
            return self
        end

        if available_square(square)
            @square = square
            @first_movement = false

            return self
        end

        raise "Invalid movement"
    end

    def available_square(square)
        raise "Method must be overwritten"
    end

    def obstruction?(square)
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