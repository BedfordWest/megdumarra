require 'gosu'
require_relative 'constants.rb'
require_relative '../map/map.rb'
require_relative '../systems/input/input.rb'
require_relative '../systems/physics/world.rb'

class Megdumarra < Gosu::Window
    include Constants

    def initialize
        super (RENDER_Y), (RENDER_X)
        self.caption = "Megdumarra v0.1b"
        @world = World.new
        @map = Map.new(WORLD_Y, WORLD_X)
        @map.randomize
        @world.add_entities(@map.humans)
        @world.add_entities(@map.corruptions)
        @player = @map.player
        @world.add_body(@player.body)
        @input = Input.new(@player)
        @last_ms = 0
    end

    def update
        delta = update_time
        @input.handle_input
        @player.update(delta)
        @map.humans.each { |human| human.update(delta) }
        @world.update(delta)
    end

    #get ms elapsed since last update - should always be 1000/60 since this updates 60 times/s
    def update_time
        delta = Gosu.milliseconds - @last_ms
        @last_ms = Gosu.milliseconds
        delta
    end

    def draw
        draw_rect(0,0,RENDER_Y,RENDER_X,Gosu::Color::GRAY,0)
        @map.draw
    end
end

Megdumarra.new.show
