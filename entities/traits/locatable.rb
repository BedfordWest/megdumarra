module Locatable
    def with_location(point)
        @location = point
        self 
    end

    def location
        @location
    end
end