class Knight < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2658"
        end

        "\u265E"
    end

    def available_square?(square)
        if !square.piece.nil? && square.piece.color == @color
            return false
        end

        return square.row == @square.row + 2 && square.column == @square.column + 1 ||
               square.row == @square.row + 1 && square.column == @square.column + 2 ||
               square.row == @square.row + 2 && square.column == @square.column - 1 ||
               square.row == @square.row + 1 && square.column == @square.column - 2 ||
               square.row == @square.row - 2 && square.column == @square.column + 1 ||
               square.row == @square.row - 1 && square.column == @square.column + 2 ||
               square.row == @square.row - 2 && square.column == @square.column - 1 ||
               square.row == @square.row - 1 && square.column == @square.column - 2
    end

end