class Pawn < Piece

    def to_s
        if color == BLACK
            return "\u265F"
        end

        return "\u2659"
    end

end