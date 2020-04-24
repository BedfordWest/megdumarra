class Point
    attr_accessor :x
    attr_accessor :y

    def initialize(x,y)
        @x = x
        @y = y
    end

    # subtracts the provided point from this one and returns the difference
    def minus(point)
        delta_x = @x - point.x
        delta_y = @y - point.y
        Point.new(delta_x, delta_y)
    end
end