require_relative '../game/constants.rb'
require_relative 'locatable.rb'
require_relative '../systems/physics/bodies/body.rb'
require_relative '../systems/physics/bodies/fixture.rb'
require_relative '../systems/physics/moveable.rb'
require_relative '../systems/physics/geometry/shape.rb'

class Entity
    include Locatable
    include Moveable
    def initialize(body, color, loc)
        #default to location at (-1,1) to indicate this entity is not yet positioned somewhere
        @location = loc
        @vel = Velocity.new(0,0)
        @color = color
        @body = body
        @body.entity = self
    end

    def update
        @body.with_location(@location)
    end

    def with_vel(vel)
        @vel = vel
        self
    end

    def vel
        @vel
    end

    def body
        @body
    end

    def with_location(loc)
        @location = loc
        @body.with_location(loc)
        self 
    end
end