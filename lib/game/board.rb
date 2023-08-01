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

        for i in 0..HEIGHT - 1 do
            for j in 0..WIDTH - 1 do
                squares[i][j] = Square.new(
                    HEIGHT - 1 - i, j, square_color(i, j)
                )
            end
        end

        squares
    end

    private def square_color(row, column)
        if row % 2 != 0
            return column.odd? ? Game::WHITE : Game::BLACK
        else
            return column.odd? ? Game::BLACK : Game::WHITE
        end
    end

    def get_square(row, column)
        squares[HEIGHT - 1 - row][column]
    end

    def get_piece(row, column)
        square = squares[HEIGHT - 1 - row][column]
        square.piece
    end

    def set_piece(piece, row, column)
        square = squares[HEIGHT - 1 - row][column]
        square.piece = piece
        piece.square = square
        piece.board = self
    end

end