class Bishop < Piece

    def to_s
        if @color == Game::BLACK
            return "\u2657"
        end

        "\u265D"
    end

end