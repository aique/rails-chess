class Container
    extend Dry::Container::Mixin

    register "game" do
        Game.new(
            self["board"],
            self["display"]
        )
    end

    register "board" do
        Board.new(self["piece_factory"])
    end

    register "display" do
        Display.new
    end

    register "piece_factory" do
        PieceFactory.new
    end

end