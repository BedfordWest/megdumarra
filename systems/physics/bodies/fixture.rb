#A fixture represents a single physical "shape" on a physics body
class Fixture
    attr_reader :center
    attr_reader :shape

    def initialize(shape)
        @shape = shape
        @center = @shape.center
    end

    def with_center(loc)
        @center = loc
        @shape.with_center(loc)
    end
end