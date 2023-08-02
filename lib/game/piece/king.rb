class King < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2654"
        end

        "\u265A"
    end

    def available_square?(destination)
        if unitary_movement?(destination) && empty_or_capturable?(destination)
            return diagonal_movement?(destination) || lineal_movement?(destination)
        end

        false
    end

    private def unitary_movement?(square)
        difference = (square.row - @square.row).abs + (square.column - @square.column).abs

        if lineal_movement?(square)
            return difference == 1
        end

        difference == 2
    end

end