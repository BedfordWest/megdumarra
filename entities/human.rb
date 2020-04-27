require 'gosu'
require_relative '../systems/physics/geometry/point.rb'
require_relative 'livingentity.rb'

class Human < LivingEntity
    def initialize(loc)
        color = Gosu::Color.argb(0xff_edd8ca) #dark peach
        square = Square.new(loc).with_sides(1).set_corners
        fixture = Fixture.new(square)
        body = Body.new.with_fixture(fixture)
        @move_rate = 0.005
        @move_frequency = 2000
        @elapsed = 0
        super(body, color, loc)
    end

    def draw
        bounds = @body.shape
        Gosu::draw_rect(
            bounds.top_left.x * Constants::RENDER_SCALE, 
            bounds.top_left.y * Constants::RENDER_SCALE, 
            bounds.width * Constants::RENDER_SCALE, 
            bounds.height * Constants::RENDER_SCALE, 
            @color, 
            1
        )
    end

    def update(delta)
        @direction = Gosu::random(0.0, 2 * Math::PI)
        if time_to_move(delta)
            update_velocity
        end        
        move(delta)
    end

    def time_to_move(delta)
        @elapsed += delta
        if(@elapsed > @move_frequency)
            @elapsed %= @move_frequency
            return true
        else
            return false
        end
    end

    def update_velocity
        @vel.x = @move_rate * Math.cos(@direction)
        @vel.y = @move_rate * Math.sin(@direction)
    end
end