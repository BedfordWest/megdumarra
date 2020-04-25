require_relative 'entity.rb'

class Player < Entity
    attr_accessor :hit
    def initialize(loc)
        color = Gosu::Color::BLUE
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
            2
        )            
    end

    def update(delta)
        if @hit
            @color = Gosu::Color::RED
        end
    end

end