class PieceFactory

    PAWN = "pawn"
    
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
            else
                raise "Unknown piece type"
        end
    end

end