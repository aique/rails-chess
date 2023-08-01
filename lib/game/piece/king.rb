class King < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2654"
        end

        "\u265A"
    end

end