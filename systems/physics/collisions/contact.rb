require_relative '../bodies/body.rb'
require_relative '../bodies/fixture.rb'

class Contact
    attr_reader :obj_1
    attr_reader :obj_2
    attr_accessor :first #boolean for first contact or not

    def initialize(obj_1, obj_2)
        raise ArgumentError.new("Objects passed to contact must be of the same type!") unless (obj_1.class == obj_2.class)
        if (!(obj_1.is_a? Fixture) && !(obj_1.is_a? Body))
            raise ArgumentError.new("Objects passed to contact must be fixtures or bodies!")
        end
        @obj_1 = obj_1
        @obj_2 = obj_2
        @first = true #contact is always first when initially created
    end

    #check if a physics object is part of this collision
    def contains?(obj)
        if (!(obj.is_a? Fixture) && !(obj.is_a? Body))
            raise ArgumentError.new("Only fixtures or bodies can be checked againt a contact!")
        end
        (obj.eql? @obj_1) || (obj.eql? @obj_2)
    end
end
