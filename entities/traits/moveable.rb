require_relative '../../systems/physics/velocity.rb'
require_relative 'locatable.rb'
module Moveable
    include Locatable

    #move location by the object's velocity and time in s (delta)
    def move(delta)
        new_x = self.location.x + (self.vel.x * delta)
        new_y = self.location.y + (self.vel.y * delta)
        new_point = Point.new(new_x, new_y)
        self.with_location(new_point)
    end
end