class Container
    extend Dry::Container::Mixin

    register "game" do
        Game.new(
            self["board"],
            self["referee"],
            self["display"]
        )
    end

    register "board" do
        Board.new
    end

    register "display" do
        Display.new
    end

    register "referee" do
        Referee.new(self["piece_factory"])
    end

    register "piece_factory" do
        PieceFactory.new
    end

end