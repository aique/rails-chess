require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/game'

describe Game do

    context "given an empty board with one white pawn" do
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

    context "given an empty board with one black pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(PieceFactory::PAWN, Game::BLACK)
        game.board.set_piece(pawn, 7, 1)

        it "that piece can move forward one square" do
            pawn.square = game.board.get_square(6, 1)
            expect(pawn.square.row).to eq(6)
            expect(pawn.square.column).to eq(1)
        end
    end

    context "given an empty board with one white pawn" do
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

        it "that piece can't move diagonal backward right" do
            expect{pawn.square = game.board.get_square(0, 2)}.to raise_error("Invalid movement")
        end

        it "that piece can't move diagonal backward left" do
            expect{pawn.square = game.board.get_square(0, 0)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with one black pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(PieceFactory::PAWN, Game::BLACK)
        game.board.set_piece(pawn, 6, 1)

        it "that piece can't move backward" do
            expect{pawn.square = game.board.get_square(7, 1)}.to raise_error("Invalid movement")
        end

        it "that piece can't move to the right" do
            expect{pawn.square = game.board.get_square(6, 0)}.to raise_error("Invalid movement")
        end

        it "that piece can't move to the left" do
            expect{pawn.square = game.board.get_square(6, 2)}.to raise_error("Invalid movement")
        end

        it "that piece can't move diagonal forward right" do
            expect{pawn.square = game.board.get_square(5, 0)}.to raise_error("Invalid movement")
        end

        it "that piece can't move diagonal forward left" do
            expect{pawn.square = game.board.get_square(5, 2)}.to raise_error("Invalid movement")
        end

        it "that piece can't move diagonal backward right" do
            expect{pawn.square = game.board.get_square(7, 0)}.to raise_error("Invalid movement")
        end

        it "that piece can't move diagonal backward left" do
            expect{pawn.square = game.board.get_square(7, 2)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with one white pawn" do
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

    context "given an empty board with two rival pawns, one in front of the other" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn1 = factory.build_piece(PieceFactory::PAWN, Game::WHITE)
        pawn2 = factory.build_piece(PieceFactory::PAWN, Game::BLACK)
        
        game.board.set_piece(pawn1, 1, 1)
        game.board.set_piece(pawn2, 2, 1)

        it "white pawn can't make a movement" do
            expect{pawn1.square = game.board.get_square(2, 1)}.to raise_error("Invalid movement")
            expect{pawn1.square = game.board.get_square(3, 1)}.to raise_error("Invalid movement")
        end

        it "black pawn can't make a movement" do
            expect{pawn2.square = game.board.get_square(1, 1)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with two white pawns, one in front of the other" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn1 = factory.build_piece(PieceFactory::PAWN, Game::WHITE)
        pawn2 = factory.build_piece(PieceFactory::PAWN, Game::WHITE)
        
        game.board.set_piece(pawn1, 1, 1)
        game.board.set_piece(pawn2, 2, 1)

        it "white pawn can't make a movement" do
            expect{pawn1.square = game.board.get_square(2, 1)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with two rival pawns and white can attack black pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn1 = factory.build_piece(PieceFactory::PAWN, Game::WHITE)
        pawn2 = factory.build_piece(PieceFactory::PAWN, Game::BLACK)
        
        game.board.set_piece(pawn1, 1, 1)
        game.board.set_piece(pawn2, 2, 2)

        it "white pawn capture black pawn" do
            pawn1.square = game.board.get_square(2, 2)
            expect(pawn1.square.row).to eq(2)
            expect(pawn1.square.column).to eq(2)
            expect(game.board.get_square(2, 2).piece).to eq(pawn1)
        end
    end

end