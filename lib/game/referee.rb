require_relative 'piece/factory'

class Referee

    def initialize(factory)
        @factory = factory
    end

    def set_up_pieces(board, white_player, black_player)
        for row in 0..Board::HEIGHT - 1 do
            for column in 0..Board::WIDTH - 1 do
                board.set_piece(nil, row, column)
            end
        end

        for column in 0..Board::WIDTH - 1 do
            board.set_piece(@factory.build_piece(Piece::PAWN, Game::WHITE, white_player), 1, column)
            board.set_piece(@factory.build_piece(Piece::PAWN, Game::BLACK, black_player), 6, column)
        end

        board.set_piece(@factory.build_piece(Piece::ROOK, Game::WHITE, white_player), 0, 0)
        board.set_piece(@factory.build_piece(Piece::ROOK, Game::WHITE, white_player), 0, 7)
        board.set_piece(@factory.build_piece(Piece::ROOK, Game::BLACK, black_player), 7, 0)
        board.set_piece(@factory.build_piece(Piece::ROOK, Game::BLACK, black_player), 7, 7)

        board.set_piece(@factory.build_piece(Piece::KNIGHT, Game::WHITE, white_player), 0, 1)
        board.set_piece(@factory.build_piece(Piece::KNIGHT, Game::WHITE, white_player), 0, 6)
        board.set_piece(@factory.build_piece(Piece::KNIGHT, Game::BLACK, black_player), 7, 1)
        board.set_piece(@factory.build_piece(Piece::KNIGHT, Game::BLACK, black_player), 7, 6)

        board.set_piece(@factory.build_piece(Piece::BISHOP, Game::WHITE, white_player), 0, 2)
        board.set_piece(@factory.build_piece(Piece::BISHOP, Game::WHITE, white_player), 0, 5)
        board.set_piece(@factory.build_piece(Piece::BISHOP, Game::BLACK, black_player), 7, 2)
        board.set_piece(@factory.build_piece(Piece::BISHOP, Game::BLACK, black_player), 7, 5)

        board.set_piece(@factory.build_piece(Piece::QUEEN, Game::WHITE, white_player), 0, 3)
        board.set_piece(@factory.build_piece(Piece::QUEEN, Game::BLACK, black_player), 7, 3)

        board.set_piece(@factory.build_piece(Piece::KING, Game::WHITE, white_player), 0, 4)
        board.set_piece(@factory.build_piece(Piece::KING, Game::BLACK, black_player), 7, 4)
    end

end