module Collisions
    def check_collisions(world)
        world.bodies.combination(2).each { |body1, body2|
            if(body2.entity.is_a? Player)
                center1 = body1.shape.center
                center2 = body2.shape.center
                #puts "#{body1.entity.class} at [#{center1.x},#{center1.y}] and #{body2.entity.class} at [#{center2.x},#{center2.y}]"
            end
            if (body1.collides body2)
                world.add_contact(body1, body2)
            end
        }
    end
end