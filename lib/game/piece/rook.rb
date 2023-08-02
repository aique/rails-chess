class Rook < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2656"
        end

        "\u265C"
    end

    def available_square?(destination)
        if !@board.obstruction?(@square, destination) && empty_or_capturable?(destination)
            return lineal_movement?(destination)
        end

        false
    end

end