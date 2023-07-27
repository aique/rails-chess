require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require 'container'

describe PieceFactory do

    context "given a piece factory" do
        factory = Container["piece_factory"]

        it "must return four black pawns" do
            pieces = factory.build(PieceFactory::PAWN, Game::BLACK, 4)

            expect(pieces.length).to eq(4)
            expect(pieces[0].color).to eq(Game::BLACK)
            expect(pieces[0].instance_of? Pawn).to eq(true)
        end

        it "must return return error when type is incorrect" do
            expect{factory.build("randomstr", Game::BLACK, 4)}.to raise_error("Unknown piece type")
        end
    end

end