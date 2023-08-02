class Bishop < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2657"
        end

        "\u265D"
    end

    def available_square?(square)
        if !obstruction?(square) && empty_or_capturable?(square)
            return diagonal_movement?(square)
        end

        false
    end

end