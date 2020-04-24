class Shape
    attr_reader :center

    def initialize(center)
        @center = center
    end

    def with_center(center)
        @center = center
    end
end