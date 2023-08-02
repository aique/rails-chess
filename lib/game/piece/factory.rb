class PieceFactory

    def build(type, color, units)
        pieces = []

        units.times do
            pieces.push(build_piece(type, color))
        end

        pieces
    end

    def build_piece(type, color, player = nil)
        case type
            when Piece::PAWN
                return Pawn.new(color, player)
            when Piece::ROOK
                return Rook.new(color, player)
            when Piece::KNIGHT
                return Knight.new(color, player)
            when Piece::BISHOP
                return Bishop.new(color, player)
            when Piece::QUEEN
                return Queen.new(color, player)
            when Piece::KING
                return King.new(color, player)
            else
                raise "Unknown piece type"
        end
    end

end