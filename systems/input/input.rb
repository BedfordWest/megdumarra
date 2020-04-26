class Input
    #for now, assume input will always be from the perspective of a player
    def initialize(player)
        @player = player
    end

    def handle_input
        vel_x = 0
        vel_y = 0
        if Gosu.button_down? Gosu::KB_A or Gosu.button_down? Gosu::GP_LEFT
            vel_x -= 0.005
        end
        if Gosu.button_down? Gosu::KB_D or Gosu.button_down? Gosu::GP_RIGHT
            vel_x += 0.005
        end
        if Gosu.button_down? Gosu::KB_W or Gosu.button_down? Gosu::GP_UP
            vel_y -= 0.005
        end
        if Gosu.button_down? Gosu::KB_S or Gosu.button_down? Gosu::GP_DOWN
            vel_y += 0.005
        end
        vel = Velocity.new(vel_x,vel_y)
        @player.vel = vel
    end

    def button_down(id)
        if id == Gosu::KB_ESCAPE
          close
        else
          super
        end
    end
end