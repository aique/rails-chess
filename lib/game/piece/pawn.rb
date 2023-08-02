class Pawn < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2659"
        end

        "\u265F"
    end

    protected def available_square?(square)
        capture_square = false
        advance_square = false

        if capture_available?(square)
            capture_square = valid_capture_row(square.row) && valid_capture_column(square.column)
        end

        if !obstruction?(square) && square.piece.nil?
            advance_square = valid_row(square.row) && valid_column(square.column)
        end

        capture_square || advance_square
    end

    private def valid_row(row)
        if @color == Game::WHITE
            return row == @square.row + 1 || (@first_movement && row == @square.row + 2)
        end
            
        row == @square.row - 1 || (@first_movement && row == @square.row - 2)
    end

    private def valid_column(column)
        column == @square.column
    end

    private def valid_capture_row(row)
        if @color == Game::WHITE
            return row == @square.row + 1
        end
            
        row == @square.row - 1
    end

    private def valid_capture_column(column)
        column == @square.column - 1 || column == @square.column + 1
    end

end