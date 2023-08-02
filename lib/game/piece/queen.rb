class Queen < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2655"
        end

        "\u265B"
    end

    def available_square?(destination)
        if !@board.obstruction?(@square, destination) && empty_or_capturable?(destination)
            return diagonal_movement?(destination) || lineal_movement?(destination)
        end

        false
    end

end