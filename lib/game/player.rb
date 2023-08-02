class Player

    attr_reader :name, :color, :captures

    def initialize(name, color)
        @name = name
        @color = color
        @captures = []
    end

    def append_capture(piece)
        @captures << piece
    end

    def captured?(type)
        @captures.each do |piece|
            if piece.is_a? get_piece_class(type)
                return true
            end
        end

        false
    end

    private def get_piece_class(type)
        case type
            when Piece::PAWN
                return Pawn
            when Piece::ROOK
                return Rook
            when Piece::KNIGHT
                return Knight
            when Piece::BISHOP
                return Bishop
            when Piece::QUEEN
                return Queen
            when Piece::KING
                return King
            else
                raise "Unknown piece type"
        end
    end

end