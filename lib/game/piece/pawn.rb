class Pawn < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2659"
        end

        "\u265F"
    end

    def available_square?(square)
        unless obstruction?(square)
            return valid_row(square.row) && valid_column(square.column)
        end

        return false
    end

    def valid_row(row)
        if @color == Game::WHITE
            return row == @square.row + 1 || (@first_movement && row == @square.row + 2)
        end
            
        row == @square.row - 1 || (@first_movement && row == @square.row - 2)
    end

    def valid_column(column)
        column == @square.column
    end

end