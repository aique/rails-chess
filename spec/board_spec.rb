require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/game'

describe Board do

    context "given an empty board" do
        board = Container["board"]

        it "left bottom square should be black and placed at 0,0" do
            square = board.squares[7][0]

            expect(square.row).to eq(0)
            expect(square.column).to eq(0)
            expect(square.color).to eq(Game::BLACK)
        end

        it "left top square should be white and placed at 7,0" do
            square = board.squares[0][0]

            expect(square.row).to eq(7)
            expect(square.column).to eq(0)
            expect(square.color).to eq(Game::WHITE)
        end

        it "right bottom square should be white and placed at 0,7" do
            square = board.squares[7][7]

            expect(square.row).to eq(0)
            expect(square.column).to eq(7)
            expect(square.color).to eq(Game::WHITE)
        end

        it "right top square should be black and placed at 7,7" do
            square = board.squares[0][7]

            expect(square.row).to eq(7)
            expect(square.column).to eq(7)
            expect(square.color).to eq(Game::BLACK)
        end
    end

end