class MovementParser

    COLUMN_LETTERS = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']

    def parse_movement(input, board)
        unless input.match(/^([a-h]{1}[1-8]{1}){2}$/)
            return nil
        end

        origin = input[0..1]
        destination = input[2..3]

        piece = board.get_piece(
            origin[1].to_i, get_column(origin[0])
        )

        destination = board.get_square(
            destination[1].to_i, get_column(destination[0])
        )

        Movement.new(piece, destination)
    end

    def get_column(letter)
        COLUMN_LETTERS.index(letter)
    end

end