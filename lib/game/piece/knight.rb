class Knight < Piece

    def to_s
        if color == Game::BLACK
            return "\u2658"
        end

        "\u265E"
    end

    def available_square?(destination)
        if destination.piece && destination.piece.color == color
            return false
        end

        origin_row = square.row
        origin_column = square.column
        destination_row = destination.row
        destination_column = destination.column

        destination_row == origin_row + 2 && destination_column == origin_column + 1 ||
        destination_row == origin_row + 1 && destination_column == origin_column + 2 ||
        destination_row == origin_row + 2 && destination_column == origin_column - 1 ||
        destination_row == origin_row + 1 && destination_column == origin_column - 2 ||
        destination_row == origin_row - 2 && destination_column == origin_column + 1 ||
        destination_row == origin_row - 1 && destination_column == origin_column + 2 ||
        destination_row == origin_row - 2 && destination_column == origin_column - 1 ||
        destination_row == origin_row - 1 && destination_column == origin_column - 2
    end

end