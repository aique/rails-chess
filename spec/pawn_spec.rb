require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/game'

describe Game do

    context "given an empty board with one pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(PieceFactory::PAWN, Game::WHITE)
        game.board.set_piece(pawn, 1, 1)

        it "that piece knows its square" do
            expect(pawn.square).not_to eq(nil)
            expect(pawn.square.row).to eq(1)
            expect(pawn.square.column).to eq(1)
        end

        it "that piece can move forward one square" do
            pawn.square = game.board.get_square(2, 1)
            expect(pawn.square.row).to eq(2)
            expect(pawn.square.column).to eq(1)
        end
    end

    context "given an empty board with one pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(PieceFactory::PAWN, Game::WHITE)
        game.board.set_piece(pawn, 1, 1)

        it "that piece can't move backward" do
            expect{pawn.square = game.board.get_square(0, 1)}.to raise_error("Invalid movement")
        end

        it "that piece can't move to the right" do
            expect{pawn.square = game.board.get_square(1, 2)}.to raise_error("Invalid movement")
        end

        it "that piece can't move to the left" do
            expect{pawn.square = game.board.get_square(1, 0)}.to raise_error("Invalid movement")
        end

        it "that piece can't move diagonal forward right" do
            expect{pawn.square = game.board.get_square(2, 2)}.to raise_error("Invalid movement")
        end

        it "that piece can't move diagonal forward left" do
            expect{pawn.square = game.board.get_square(2, 0)}.to raise_error("Invalid movement")
        end

        it "that piece can't move diagonal backward left" do
            expect{pawn.square = game.board.get_square(0, 0)}.to raise_error("Invalid movement")
        end

        it "that piece can't move diagonal backward right" do
            expect{pawn.square = game.board.get_square(0, 2)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with one pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(PieceFactory::PAWN, Game::WHITE)
        game.board.set_piece(pawn, 1, 1)

        it "that piece can move two squares forward in its first movement" do
            pawn.square = game.board.get_square(3, 1)
            expect(pawn.square.row).to eq(3)
            expect(pawn.square.column).to eq(1)
        end

        it "but that piece can't move two squares forward in its next movements" do
            expect{pawn.square = game.board.get_square(5, 1)}.to raise_error("Invalid movement")
        end

        it "only one square forward allowed" do
            pawn.square = game.board.get_square(4, 1)
            expect(pawn.square.row).to eq(4)
            expect(pawn.square.column).to eq(1)
        end
    end

end