require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/game'

describe Game do

    context "given an empty board with one white queen" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        queen = factory.build_piece(PieceFactory::QUEEN, Game::WHITE)
        game.board.set_piece(queen, 4, 4)

        it "that piece can move like a queen" do
            queen.square = game.board.get_square(4, 7)
            expect(queen.square.row).to eq(4)
            expect(queen.square.column).to eq(7)

            queen.square = game.board.get_square(7, 7)
            expect(queen.square.row).to eq(7)
            expect(queen.square.column).to eq(7)

            queen.square = game.board.get_square(4, 4)
            expect(queen.square.row).to eq(4)
            expect(queen.square.column).to eq(4)

            queen.square = game.board.get_square(7, 1)
            expect(queen.square.row).to eq(7)
            expect(queen.square.column).to eq(1)

            queen.square = game.board.get_square(4, 1)
            expect(queen.square.row).to eq(4)
            expect(queen.square.column).to eq(1)

            queen.square = game.board.get_square(0, 5)
            expect(queen.square.row).to eq(0)
            expect(queen.square.column).to eq(5)

            expect{queen.square = game.board.get_square(2, 6)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with one white queen and one white pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(PieceFactory::PAWN, Game::WHITE)
        queen = factory.build_piece(PieceFactory::QUEEN, Game::WHITE)
        
        game.board.set_piece(pawn, 4, 5)
        game.board.set_piece(queen, 4, 4)

        it "queen can't move through a square occupied by the pawn" do
            expect{queen.square = game.board.get_square(4, 5)}.to raise_error("Invalid movement")
            expect{queen.square = game.board.get_square(4, 6)}.to raise_error("Invalid movement")
        end
    end

    context "given an empty board with one black queen and one white pawn" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        pawn = factory.build_piece(PieceFactory::PAWN, Game::WHITE)
        queen = factory.build_piece(PieceFactory::QUEEN, Game::BLACK)
        
        game.board.set_piece(pawn, 4, 5)
        game.board.set_piece(queen, 4, 4)

        it "queen can't move through a square occupied by the pawn" do
            expect{queen.square = game.board.get_square(4, 6)}.to raise_error("Invalid movement")
        end

        it "queen can capture the white pawn" do
            queen.square = game.board.get_square(4, 5)
            expect(queen.square.row).to eq(4)
            expect(queen.square.column).to eq(5)
        end
    end

end