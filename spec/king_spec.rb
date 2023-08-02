require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/game'

describe Game do

    context "given an empty board with one white king" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        king = factory.build_piece(Piece::KING, Game::WHITE)
        game.board.set_piece(king, 4, 4)

        it "that piece can move like a king" do
            king.square = game.board.get_square(4, 5)
            expect(king.square.row).to eq(4)
            expect(king.square.column).to eq(5)

            king.square = game.board.get_square(5, 5)
            expect(king.square.row).to eq(5)
            expect(king.square.column).to eq(5)

            king.square = game.board.get_square(4, 4)
            expect(king.square.row).to eq(4)
            expect(king.square.column).to eq(4)

            king.square = game.board.get_square(5, 3)
            expect(king.square.row).to eq(5)
            expect(king.square.column).to eq(3)

            king.square = game.board.get_square(4, 3)
            expect(king.square.row).to eq(4)
            expect(king.square.column).to eq(3)

            king.square = game.board.get_square(3, 2)
            expect(king.square.row).to eq(3)
            expect(king.square.column).to eq(2)

            expect{king.square = game.board.get_square(5, 2)}.to raise_error("Invalid movement")
            expect{king.square = game.board.get_square(5, 4)}.to raise_error("Invalid movement")
            expect{king.square = game.board.get_square(3, 0)}.to raise_error("Invalid movement")
            expect{king.square = game.board.get_square(1, 0)}.to raise_error("Invalid movement")
            expect{king.square = game.board.get_square(1, 2)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with one white king and one white pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(Piece::PAWN, Game::WHITE)
        king = factory.build_piece(Piece::KING, Game::WHITE)
        
        game.board.set_piece(pawn, 4, 5)
        game.board.set_piece(king, 4, 4)

        it "king can't move through a square occupied by the pawn" do
            expect{king.square = game.board.get_square(4, 5)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with one black king and one white pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(Piece::PAWN, Game::WHITE)
        king = factory.build_piece(Piece::KING, Game::BLACK)
        
        game.board.set_piece(pawn, 4, 5)
        game.board.set_piece(king, 4, 4)

        it "king can capture the white pawn" do
            king.square = game.board.get_square(4, 5)
            expect(king.square.row).to eq(4)
            expect(king.square.column).to eq(5)
        end
    end

end