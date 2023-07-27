require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require_relative 'container'

require_relative 'game/game'
require_relative 'game/board'
require_relative 'game/square'
require_relative 'game/display'
require_relative 'game/piece/piece'
require_relative 'game/piece/pawn'
require_relative 'game/piece/factory'

class Main

    def play
        game = Container["game"]
        game.start()
    end

end

if __FILE__ == $0
    main = Main.new
    main.play
end