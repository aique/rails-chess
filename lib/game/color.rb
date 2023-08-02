class Color

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def to_s
        if name == Game::BLACK
            return "\u25A1"
        end

        "\u25A0"
    end

end