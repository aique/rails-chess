require_relative 'square'
require_relative 'piece/piece'
require_relative 'piece/pawn'
require_relative 'piece/rook'
require_relative 'piece/knight'
require_relative 'piece/bishop'
require_relative 'piece/queen'
require_relative 'piece/king'
require_relative 'piece/factory'

class Board

    WIDTH = HEIGHT = 8
    COLUMN_NAMES = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']

    attr_reader :squares

    def initialize(factory)
        @squares = initialize_squares
        @factory = factory
    end

    private def initialize_squares
        squares = Array.new(HEIGHT) { Array.new(WIDTH) { nil } }

        for i in 0..HEIGHT - 1 do
            for j in 0..WIDTH - 1 do
                squares[i][j] = Square.new(
                    (HEIGHT - i).to_s,
                    COLUMN_NAMES[j],
                    square_color(i, j)
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

    def set_up_pieces
        for i in 0..HEIGHT - 1 do
            for j in 0..WIDTH - 1 do
                squares[i][j].piece = nil
            end
        end

        for i in 0..WIDTH - 1 do
            squares[6][i].piece = @factory.build_piece(PieceFactory::PAWN, Game::WHITE)
            squares[1][i].piece = @factory.build_piece(PieceFactory::PAWN, Game::BLACK)
        end

        squares[7][0].piece = @factory.build_piece(PieceFactory::ROOK, Game::WHITE)
        squares[7][7].piece = @factory.build_piece(PieceFactory::ROOK, Game::WHITE)
        squares[0][0].piece = @factory.build_piece(PieceFactory::ROOK, Game::BLACK)
        squares[0][7].piece = @factory.build_piece(PieceFactory::ROOK, Game::BLACK)

        squares[7][1].piece = @factory.build_piece(PieceFactory::KNIGHT, Game::WHITE)
        squares[7][6].piece = @factory.build_piece(PieceFactory::KNIGHT, Game::WHITE)
        squares[0][1].piece = @factory.build_piece(PieceFactory::KNIGHT, Game::BLACK)
        squares[0][6].piece = @factory.build_piece(PieceFactory::KNIGHT, Game::BLACK)

        squares[7][2].piece = @factory.build_piece(PieceFactory::BISHOP, Game::WHITE)
        squares[7][5].piece = @factory.build_piece(PieceFactory::BISHOP, Game::WHITE)
        squares[0][2].piece = @factory.build_piece(PieceFactory::BISHOP, Game::BLACK)
        squares[0][5].piece = @factory.build_piece(PieceFactory::BISHOP, Game::BLACK)

        squares[7][3].piece = @factory.build_piece(PieceFactory::QUEEN, Game::WHITE)
        squares[0][3].piece = @factory.build_piece(PieceFactory::QUEEN, Game::BLACK)

        squares[7][4].piece = @factory.build_piece(PieceFactory::KING, Game::WHITE)
        squares[0][4].piece = @factory.build_piece(PieceFactory::KING, Game::BLACK)
    end

end