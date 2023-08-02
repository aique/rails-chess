class Knight < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2658"
        end

        "\u265E"
    end

    def available_square?(destination)
        if !destination.piece.nil? && destination.piece.color == @color
            return false
        end

        destination.row == @square.row + 2 && destination.column == @square.column + 1 ||
        destination.row == @square.row + 1 && destination.column == @square.column + 2 ||
        destination.row == @square.row + 2 && destination.column == @square.column - 1 ||
        destination.row == @square.row + 1 && destination.column == @square.column - 2 ||
        destination.row == @square.row - 2 && destination.column == @square.column + 1 ||
        destination.row == @square.row - 1 && destination.column == @square.column + 2 ||
        destination.row == @square.row - 2 && destination.column == @square.column - 1 ||
        destination.row == @square.row - 1 && destination.column == @square.column - 2
    end

end