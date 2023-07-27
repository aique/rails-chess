class PieceFactory

    PAWN = "pawn"
    ROOK = "rook"
    KNIGHT = "knight"
    BISHOP = "bishop"
    QUEEN = "queen"
    KING = "king"
    
    def build(type, color, units)
        pieces = []

        units.times do
            pieces.push(build_piece(type, color))
        end

        pieces
    end

    def build_piece(type, color)
        case type
            when PAWN
                return Pawn.new(color)
            when ROOK
                return Rook.new(color)
            when KNIGHT
                return Knight.new(color)
            when BISHOP
                return Bishop.new(color)
            when QUEEN
                return Queen.new(color)
            when KING
                return King.new(color)
            else
                raise "Unknown piece type"
        end
    end

end