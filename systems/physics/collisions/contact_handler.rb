require_relative 'contact.rb'
require_relative 'player_contacts'

#Handle the logic for all contacts in a given game cycle
class ContactHandler
    include PlayerContacts

    def initialize
        @body_contacts = Array.new #will store all of the body contacts for the handler to check
        @fixture_contacts = Array.new #will store all of the fixture contacts for the handler to check
    end

    #iterate through the contacts and perform updates to entities accordingly
    def update(delta)
        @body_contacts.each { |contact|
            case contact.obj_2.entity
            when Player
                player_contact(contact)
            end
        }
    end

    def add_contact(contact)
        if(contact.obj_1).is_a? Body
            @body_contacts << contact
        else
            @fixture_contacts << contact
            @body_contacts << Contact.new(contact.obj_1.body, contact.obj_2.body)
        end
    end
end