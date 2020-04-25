require 'gosu'
require_relative '../systems/physics/geometry/point.rb'
require_relative 'entity.rb'

class Human < Entity
    def initialize(loc)
        color = Gosu::Color.argb(0xff_edd8ca) #dark peach
        square = Square.new(loc).with_sides(1).set_corners
        fixture = Fixture.new(square)
        body = Body.new.with_fixture(fixture)
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
end