require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

require 'game/game'

describe Game do

    context "given an empty board with one white knight" do
        game = Container["game"]
        factory = Container["piece_factory"]
        
        knight = factory.build_piece(PieceFactory::KNIGHT, Game::WHITE)
        game.board.set_piece(knight, 4, 4)

        it "that piece can move like a knight" do
            knight.square = game.board.get_square(5, 6)
            expect(knight.square.row).to eq(5)
            expect(knight.square.column).to eq(6)

            knight.square = game.board.get_square(3, 5)
            expect(knight.square.row).to eq(3)
            expect(knight.square.column).to eq(5)

            knight.square = game.board.get_square(5, 4)
            expect(knight.square.row).to eq(5)
            expect(knight.square.column).to eq(4)

            knight.square = game.board.get_square(4, 2)
            expect(knight.square.row).to eq(4)
            expect(knight.square.column).to eq(2)
        end
    end

end