class Queen < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2655"
        end

        "\u265B"
    end

    def available_square?(square)
        if !obstruction?(square) && empty_or_capturable?(square)
            return diagonal_movement?(square) || lineal_movement?(square)
        end

        false
    end

end