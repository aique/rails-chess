require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/game'

describe Board do

    context "given an empty board" do
        board = Container["board"]

        it "left bottom square should be black and named 1A" do
            square = board.squares[7][0]

            expect(square.row).to eq("1")
            expect(square.column).to eq("A")
            expect(square.color).to eq(Game::BLACK)
        end

        it "left top square should be white and named 8A" do
            square = board.squares[0][0]

            expect(square.row).to eq("8")
            expect(square.column).to eq("A")
            expect(square.color).to eq(Game::WHITE)
        end

        it "right bottom square should be white and named 1H" do
            square = board.squares[7][7]

            expect(square.row).to eq("1")
            expect(square.column).to eq("H")
            expect(square.color).to eq(Game::WHITE)
        end

        it "right top square should be black and named 8H" do
            square = board.squares[0][7]

            expect(square.row).to eq("8")
            expect(square.column).to eq("H")
            expect(square.color).to eq(Game::BLACK)
        end
    end

end