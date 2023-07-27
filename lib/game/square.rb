class Square

    attr_reader :row, :column
    attr_accessor :piece

    def initialize(row, column)
        @row = row
        @column = column
        @piece = nil
    end

end