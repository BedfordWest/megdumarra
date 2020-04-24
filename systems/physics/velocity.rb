class Velocity
    def initialize(x,y)
        @x = x # world units/ms
        @y = y # world units/ms
    end

    def with_x(x)
        @x = x
    end

    def with_y(y)
        @y = y
    end

    def x
        @x
    end

    def y
        @y
    end
end