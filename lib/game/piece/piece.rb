class Piece

    attr_reader :color
    attr_accessor :square
    
    protected def initialize(color)
        @color = color
        @square = nil
        @first_movement = true
    end

    def square=(square)
        if @square.nil?
            @square = square
            
            return self
        end

        if available_square(square)
            @square = square
            @first_movement = false

            return self
        end

        raise "Invalid movement"
    end

    def available_square(square)
        raise "Method must be overwritten"
    end

end