require_relative 'entity.rb'

class Corruption < Entity
    def initialize(loc)
        color = Gosu::Color::BLACK
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