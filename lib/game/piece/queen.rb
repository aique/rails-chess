class Queen < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2655"
        end

        "\u265B"
    end

end