class Square

    attr_reader :row, :column, :color
    attr_accessor :piece

    def initialize(row, column)
        @row = row
        @column = column
        @color = init_color
        @piece = nil
    end

    private def init_color
        odd_column = @column.odd?

        if row % 2 != 0
            return odd_column ? Game::BLACK : Game::WHITE
        end

        return odd_column ? Game::WHITE : Game::BLACK
    end

    def to_s
        if @color == Game::BLACK
            return "\u25A0"
        end

        "\u25A1"
    end

end