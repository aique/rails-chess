require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/game'

describe Game do

    context "given an empty board with one white rook" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        rook = factory.build_piece(Piece::ROOK, Game::WHITE)
        game.board.set_piece(rook, 4, 4)

        it "that piece can move like a rook" do
            rook.square = game.board.get_square(4, 7)
            expect(rook.square.row).to eq(4)
            expect(rook.square.column).to eq(7)

            rook.square = game.board.get_square(7, 7)
            expect(rook.square.row).to eq(7)
            expect(rook.square.column).to eq(7)

            rook.square = game.board.get_square(7, 1)
            expect(rook.square.row).to eq(7)
            expect(rook.square.column).to eq(1)

            rook.square = game.board.get_square(1, 1)
            expect(rook.square.row).to eq(1)
            expect(rook.square.column).to eq(1)

            expect{rook.square = game.board.get_square(2, 2)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with one white rook and one white pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(Piece::PAWN, Game::WHITE)
        rook = factory.build_piece(Piece::ROOK, Game::WHITE)
        
        game.board.set_piece(pawn, 4, 5)
        game.board.set_piece(rook, 4, 4)

        it "rook can't move through a square occupied by the pawn" do
            expect{rook.square = game.board.get_square(4, 5)}.to raise_error("Invalid movement")
            expect{rook.square = game.board.get_square(4, 6)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with one black rook and one white pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(Piece::PAWN, Game::WHITE)
        rook = factory.build_piece(Piece::ROOK, Game::BLACK)
        
        game.board.set_piece(pawn, 4, 5)
        game.board.set_piece(rook, 4, 4)

        it "rook can't move through a square occupied by the pawn" do
            expect{rook.square = game.board.get_square(4, 6)}.to raise_error("Invalid movement")
        end

        it "rook can capture the white pawn" do
            rook.square = game.board.get_square(4, 5)
            expect(rook.square.row).to eq(4)
            expect(rook.square.column).to eq(5)
        end
    end

end