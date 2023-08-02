require_relative 'square'
require_relative 'piece/piece'
require_relative 'piece/pawn'
require_relative 'piece/rook'
require_relative 'piece/knight'
require_relative 'piece/bishop'
require_relative 'piece/queen'
require_relative 'piece/king'

class Board

    WIDTH = HEIGHT = 8

    attr_reader :squares

    def initialize
        @squares = initialize_squares
    end

    private def initialize_squares
        squares = Array.new(HEIGHT) { Array.new(WIDTH) { nil } }

        height = HEIGHT - 1

        for row in 0..height do
            for column in 0..WIDTH - 1 do
                squares[row][column] = Square.new(
                    height - row, column
                )
            end
        end

        squares
    end

    def get_square(row, column)
        squares[HEIGHT - 1 - row][column]
    end

    def get_piece(row, column)
        get_square(row, column).piece
    end

    def set_piece(piece, row, column)
        square = get_square(row, column)
        square.piece = piece

        if piece
            piece.square = square
            piece.board = self
        end
    end

    def obstruction?(origin_square, destination_square)
        rows = destination_square.row - origin_square.row
        columns = destination_square.column - origin_square.column
        num_squares = [rows.abs, columns.abs].max

        next_row = origin_square.row
        next_column = origin_square.column

        for i in 1..(num_squares - 1)
            if rows > 0
                next_row = origin_square.row + i
            elsif rows < 0
                next_row = origin_square.row - i
            end

            if columns > 0
                next_column = origin_square.column + i
            elsif columns < 0
                next_column = origin_square.column - i
            end

            if get_piece(next_row, next_column)
                return true
            end
        end

        false
    end

end