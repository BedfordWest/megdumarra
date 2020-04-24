module Collisions
    def check_collisions(world)
        world.bodies.combination(2).each { |body1, body2|
            if (body1.collides body2)
                puts "collision detected between #{body1} and #{body2}"
                world.add_contact(body1, body2)
            end
        }
    end
end