class Bishop < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2657"
        end

        "\u265D"
    end

    def available_square?(square)
        if !obstruction?(square) && empty_or_capturable?(square)
            return (square.row - @square.row).abs == (square.column - @square.column).abs
        end

        return false
    end

end