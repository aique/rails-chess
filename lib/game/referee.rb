require_relative 'piece/factory'

class Referee

    def initialize(factory)
        @factory = factory
    end

    def set_up_pieces(board)
        for i in 0..Board::HEIGHT - 1 do
            for j in 0..Board::WIDTH - 1 do
                board.squares[i][j].piece = nil
            end
        end

        for i in 0..Board::WIDTH - 1 do
            board.squares[6][i].piece = @factory.build_piece(PieceFactory::PAWN, Game::WHITE)
            board.squares[1][i].piece = @factory.build_piece(PieceFactory::PAWN, Game::BLACK)
        end

        board.squares[7][0].piece = @factory.build_piece(PieceFactory::ROOK, Game::WHITE)
        board.squares[7][7].piece = @factory.build_piece(PieceFactory::ROOK, Game::WHITE)
        board.squares[0][0].piece = @factory.build_piece(PieceFactory::ROOK, Game::BLACK)
        board.squares[0][7].piece = @factory.build_piece(PieceFactory::ROOK, Game::BLACK)

        board.squares[7][1].piece = @factory.build_piece(PieceFactory::KNIGHT, Game::WHITE)
        board.squares[7][6].piece = @factory.build_piece(PieceFactory::KNIGHT, Game::WHITE)
        board.squares[0][1].piece = @factory.build_piece(PieceFactory::KNIGHT, Game::BLACK)
        board.squares[0][6].piece = @factory.build_piece(PieceFactory::KNIGHT, Game::BLACK)

        board.squares[7][2].piece = @factory.build_piece(PieceFactory::BISHOP, Game::WHITE)
        board.squares[7][5].piece = @factory.build_piece(PieceFactory::BISHOP, Game::WHITE)
        board.squares[0][2].piece = @factory.build_piece(PieceFactory::BISHOP, Game::BLACK)
        board.squares[0][5].piece = @factory.build_piece(PieceFactory::BISHOP, Game::BLACK)

        board.squares[7][3].piece = @factory.build_piece(PieceFactory::QUEEN, Game::WHITE)
        board.squares[0][3].piece = @factory.build_piece(PieceFactory::QUEEN, Game::BLACK)

        board.squares[7][4].piece = @factory.build_piece(PieceFactory::KING, Game::WHITE)
        board.squares[0][4].piece = @factory.build_piece(PieceFactory::KING, Game::BLACK)
    end

end