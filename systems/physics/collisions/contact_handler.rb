require_relative 'contact.rb'
require_relative 'player_contacts.rb'

#Handle the logic for all contacts in a given game cycle
class ContactHandler
    def initialize
        @contacts = Array.new #will store all of the contacts for the handler to check
    end

    #iterate through the contacts and perform updates to entities accordingly
    def update
        @contacts.each { |contact|
            case contact.obj_1
            when is_a? Body
                case obj_1.entity
                when is_a? Player
                    PlayerContacts.handle_contact(contact)
                end
            when is_a? Fixture
                @contacts << Contact.new(obj_1.body, obj_2.body)
            end
        }
    end

    def add_contact(contact)
        @contacts << contact
    end
end