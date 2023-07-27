class Knight < Piece

    def to_s
        if color == Game::BLACK
            return "\u2658"
        end

        "\u265E"
    end

end