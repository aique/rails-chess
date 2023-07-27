class Board

    HEIGHT = WIDTH = 8

    attr_reader :squares

    def initialize(factory)
        @squares = initialize_squares
        @factory = factory
    end

    private def initialize_squares
        columns = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
        squares = Array.new(HEIGHT) { Array.new(WIDTH) { nil } }

        for i in 0..HEIGHT - 1 do
            current_row = HEIGHT - i

            for j in 0..WIDTH - 1 do
                squares[i][j] = Square.new(current_row.to_s, columns[j])
            end
        end

        squares
    end

    def set_up_pieces
        for i in 0..HEIGHT - 1 do
            for j in 0..WIDTH - 1 do
                squares[i][j].piece = nil
            end
        end

        for i in 0..WIDTH - 1 do
            squares[1][i].piece = @factory.build_piece(PieceFactory::PAWN, Piece::WHITE)
            squares[6][i].piece = @factory.build_piece(PieceFactory::PAWN, Piece::BLACK)
        end
    end

end