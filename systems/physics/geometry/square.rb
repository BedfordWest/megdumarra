require_relative 'rectangle.rb'

class Square < Rectangle
    def with_sides(side)
        with_width(side)
        with_height(side)
        self
    end
end