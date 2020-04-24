class Body
    attr_reader :fixtures
    attr_reader :location
    attr_accessor :entity

    def initialize
        @fixtures = Array.new
    end

    def with_fixture(fixture)
        @fixtures << fixture
        update_center
        self
    end

    def update_center
        if @fixtures.length.eql? 1
            @location = @fixtures.first.center
        else
            x_total = 0
            y_total = 0
            @fixtures.each { |fixture|
                x_total += fixture.center.x
                y_total += fixture.center.y
            }
            new_x = x_total/@fixtures.length
            new_y = y_total/@fixtures.length
            @location.x = new_x
            @location.y = new_y
        end
    end

    def collides(body)
        @fixtures.first.shape.overlaps(body.fixtures.first.shape)
    end

    #update the location of the body and all fixtures
    def with_location(loc)
        delta = loc.minus(@location)
        @location = loc
        #when the body location is updated, all of the fixtures must also move
        @fixtures.each { |fixture|
            new_x = fixture.center.x + delta.x
            new_y = fixture.center.y + delta.y
            fixture.with_center(Point.new(new_x, new_y))
        }
    end
end