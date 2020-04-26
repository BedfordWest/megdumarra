class Velocity
    attr_accessor :x
    attr_accessor :y

    def initialize(x,y)
        @x = x # world units/ms
        @y = y # world units/ms
    end
end