require 'gosu'
require_relative '../map/map.rb'
require_relative '../systems/physics/world.rb'

class Megdumarra < Gosu::Window
    def initialize
        super 640, 480
        self.caption = "Megdumarra v0.1b"
        @world = World.new
        @map = Map.new(64, 48)
        @map.randomize
        @world.add_entities(@map.humans)
        @world.add_entities(@map.corruptions)
        @player = @map.player
        @world.add_body(@player.body)
        @last_ms = 0
    end

    def update
        #get ms elapsed since last update - should always be 1000/60 since this updates 60 times/s
        delta = Gosu.milliseconds - @last_ms
        @last_ms = Gosu.milliseconds
        vel_x = 0
        vel_y = 0
        if Gosu.button_down? Gosu::KB_A or Gosu::button_down? Gosu::GP_LEFT
            vel_x -= 0.005
        end
        if Gosu.button_down? Gosu::KB_D or Gosu::button_down? Gosu::GP_RIGHT
            vel_x += 0.005
        end
        if Gosu.button_down? Gosu::KB_W or Gosu::button_down? Gosu::GP_UP
            vel_y -= 0.005
        end
        if Gosu.button_down? Gosu::KB_S or Gosu::button_down? Gosu::GP_DOWN
            vel_y += 0.005
        end
        vel = Velocity.new(vel_x,vel_y)
        @player.with_vel(vel)
        @player.move(delta)
        @world.update(delta)
    end

    def draw
        draw_rect(0,0,640,480,Gosu::Color::GRAY,0)
        @map.draw
    end

    def button_down(id)
        if id == Gosu::KB_ESCAPE
          close
        elsif id == Gosu::KB_R
            @world.list_bodies
        else
          super
        end
    end
end

Megdumarra.new.show
