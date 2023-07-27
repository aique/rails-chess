require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/board'
require 'game/square'
require 'game/piece/piece'
require 'game/piece/factory'

describe Board do

    context "given an empty board" do
        board = Container["board"]

        it "left bottom square should be 1A" do
            square = board.squares[7][0]

            expect(square.row).to eq("1")
            expect(square.column).to eq("A")
        end

        it "left top square should be 8A" do
            square = board.squares[0][0]

            expect(square.row).to eq("8")
            expect(square.column).to eq("A")
        end

        it "right bottom square should be 1H" do
            square = board.squares[7][7]

            expect(square.row).to eq("1")
            expect(square.column).to eq("H")
        end

        it "right top square should be 8H" do
            square = board.squares[0][7]

            expect(square.row).to eq("8")
            expect(square.column).to eq("H")
        end
    end

end