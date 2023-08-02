class Rook < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2656"
        end

        "\u265C"
    end

    def available_square?(square)
        if !obstruction?(square) && empty_or_capturable?(square)
            return lineal_movement?(square)
        end

        false
    end

end