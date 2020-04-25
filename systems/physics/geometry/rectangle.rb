require_relative 'shape.rb'

# Rectangles store the following in addition to the typical center for a shape:
# width
# height
# upper_left: the upper left point of the rectangle, used for collision computations
# bottom_right: the bottom_right point of the rectangle, used for collision computations
class Rectangle < Shape
    attr_reader :top_left
    attr_reader :bottom_right
    attr_reader :width
    attr_reader :height

    def set_corners
        ul_x = (@center.x - @width/2.0)
        ul_y = (@center.y + @height/2.0)
        br_x = (@center.x + @width/2.0)
        br_y = (@center.y - @height/2.0)
        @top_left = Point.new(ul_x, ul_y)
        @bottom_right = Point.new(br_x, br_y)
        self
    end

    #returns true if the rectangle overlaps with the passed rectangle
    def overlaps(rect)
       !(fully_left_of(rect) || fully_right_of(rect) || fully_above(rect) || fully_below(rect))
    end

    #returns true if this rect is fully to the left of the provided rectangle
    def fully_left_of(rect)
        @bottom_right.x < rect.top_left.x
    end

    #returns true if this rect is fully to the right of the provided rectangle
    def fully_right_of(rect)
        @top_left.x > rect.bottom_right.x
    end

    #returns true if this rect is fully above the provided rectangle
    def fully_above(rect)
        @bottom_right.y > rect.top_left.y
    end

    #returns true if this rect is fully below the provided rectangle
    def fully_below(rect)
        @top_left.y < rect.bottom_right.y
    end

    def with_width(width)
        @width = width
        set_corners unless @height.nil?
        self
    end

    def with_height(height)
        @height = height
        set_corners unless @width.nil?
        self
    end

    def with_center(center)
        @center = center
        set_corners
    end
end
