class Bishop < Piece

    def to_s
        if color == Game::BLACK
            return "\u2657"
        end

        "\u265D"
    end

    def available_square?(destination)
        if !board.obstruction?(square, destination) && empty_or_capturable?(destination)
            return diagonal_movement?(destination)
        end

        false
    end

end