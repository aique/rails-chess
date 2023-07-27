class Rook < Piece

    def to_s
        if color == Game::BLACK
            return "\u2656"
        end

        "\u265C"
    end

end