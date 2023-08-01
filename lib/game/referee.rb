require_relative 'piece/factory'

class Referee

    def initialize(factory)
        @factory = factory
    end

    def set_up_pieces(board)
        for i in 0..Board::HEIGHT - 1 do
            for j in 0..Board::WIDTH - 1 do
                board.set_piece(nil, i, j)
            end
        end

        for i in 0..Board::WIDTH - 1 do
            board.set_piece(@factory.build_piece(PieceFactory::PAWN, Game::WHITE), 1, i)
            board.set_piece(@factory.build_piece(PieceFactory::PAWN, Game::BLACK), 6, i)
        end

        board.set_piece(@factory.build_piece(PieceFactory::ROOK, Game::WHITE), 0, 0)
        board.set_piece(@factory.build_piece(PieceFactory::ROOK, Game::WHITE), 0, 7)
        board.set_piece(@factory.build_piece(PieceFactory::ROOK, Game::BLACK), 7, 0)
        board.set_piece(@factory.build_piece(PieceFactory::ROOK, Game::BLACK), 7, 7)

        board.set_piece(@factory.build_piece(PieceFactory::KNIGHT, Game::WHITE), 0, 1)
        board.set_piece(@factory.build_piece(PieceFactory::KNIGHT, Game::WHITE), 0, 6)
        board.set_piece(@factory.build_piece(PieceFactory::KNIGHT, Game::BLACK), 7, 1)
        board.set_piece(@factory.build_piece(PieceFactory::KNIGHT, Game::BLACK), 7, 6)

        board.set_piece(@factory.build_piece(PieceFactory::BISHOP, Game::WHITE), 0, 2)
        board.set_piece(@factory.build_piece(PieceFactory::BISHOP, Game::WHITE), 0, 5)
        board.set_piece(@factory.build_piece(PieceFactory::BISHOP, Game::BLACK), 7, 2)
        board.set_piece(@factory.build_piece(PieceFactory::BISHOP, Game::BLACK), 7, 5)

        board.set_piece(@factory.build_piece(PieceFactory::QUEEN, Game::WHITE), 0, 3)
        board.set_piece(@factory.build_piece(PieceFactory::QUEEN, Game::BLACK), 7, 3)

        board.set_piece(@factory.build_piece(PieceFactory::KING, Game::WHITE), 0, 4)
        board.set_piece(@factory.build_piece(PieceFactory::KING, Game::BLACK), 7, 4)
    end

end