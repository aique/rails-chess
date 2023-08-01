class Square

    attr_reader :row, :column, :color
    attr_accessor :piece

    def initialize(row, column, color = Game::WHITE)
        @row = row
        @column = column
        @color = color
        @piece = nil
    end

    def to_s
        if @color == Game::BLACK
            return "\u25A0"
        end

        "\u25A1"
    end

end