require 'pry-byebug'

require 'dry-container'
require 'dry-auto_inject'

require_relative 'container'
require_relative 'game/game'

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