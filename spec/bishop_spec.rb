require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/game'

describe Game do

    context "given an empty board with one white bishop" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        bishop = factory.build_piece(Piece::BISHOP, Game::WHITE)
        game.board.set_piece(bishop, 4, 4)

        it "that piece can move like a bishop" do
            bishop.square = game.board.get_square(7, 7)
            expect(bishop.square.row).to eq(7)
            expect(bishop.square.column).to eq(7)

            bishop.square = game.board.get_square(3, 3)
            expect(bishop.square.row).to eq(3)
            expect(bishop.square.column).to eq(3)

            bishop.square = game.board.get_square(5, 1)
            expect(bishop.square.row).to eq(5)
            expect(bishop.square.column).to eq(1)

            bishop.square = game.board.get_square(0, 6)
            expect(bishop.square.row).to eq(0)
            expect(bishop.square.column).to eq(6)

            expect{bishop.square = game.board.get_square(0, 0)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with one white bishop and one white pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(Piece::PAWN, Game::WHITE)
        bishop = factory.build_piece(Piece::BISHOP, Game::WHITE)
        
        game.board.set_piece(pawn, 5, 5)
        game.board.set_piece(bishop, 4, 4)

        it "bishop can't move through a square occupied by the pawn" do
            expect{bishop.square = game.board.get_square(5, 5)}.to raise_error("Invalid movement")
            expect{bishop.square = game.board.get_square(6, 6)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with one black bishop and one white pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(Piece::PAWN, Game::WHITE)
        bishop = factory.build_piece(Piece::BISHOP, Game::BLACK)
        
        game.board.set_piece(pawn, 5, 5)
        game.board.set_piece(bishop, 4, 4)

        it "bishop can't move through a square occupied by the pawn" do
            expect{bishop.square = game.board.get_square(6, 6)}.to raise_error("Invalid movement")
        end

        it "bishop can capture the white pawn" do
            bishop.square = game.board.get_square(5, 5)
            expect(bishop.square.row).to eq(5)
            expect(bishop.square.column).to eq(5)
        end
    end

end