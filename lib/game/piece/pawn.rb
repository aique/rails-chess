class Pawn < Piece

    def to_s
        if color == Game::BLACK
            return "\u2659"
        end

        "\u265F"
    end

end