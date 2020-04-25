require_relative '../physics/collisions/collisions.rb'
require_relative '../physics/collisions/contact.rb'
require_relative '../physics/collisions/contact_handler.rb'
class World
    include Collisions
    attr_reader :bodies
    attr_reader :contacts

    def initialize
        @bodies = Array.new
        @contact_handler = ContactHandler.new
    end

    def add_body(body)
        @bodies << body
    end

    def add_entities(entities)
        entities.each { |entity|
            @bodies << entity.body
        }
    end

    def rem_body(body)
        @bodies.delete(body)
    end

    def list_bodies
        puts @bodies
    end

    def add_contact(obj_1, obj_2)
        @contact_handler.add_contact(Contact.new(obj_1, obj_2))
    end

    def update(delta)
        check_collisions(self)
        @contact_handler.update(delta)
    end
end