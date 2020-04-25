require_relative 'contact.rb'
require_relative 'player_contacts'

#Handle the logic for all contacts in a given game cycle
class ContactHandler
    include PlayerContacts

    def initialize
        @contacts = Array.new #will store all of the contacts for the handler to check
    end

    #iterate through the contacts and perform updates to entities accordingly
    def update(delta)
        @contacts.each { |contact|
            case contact.obj_2
            when Body
                case contact.obj_2.entity
                when Player
                    player_contact(contact)
                end
            when Fixture
                @contacts << Contact.new(contact.obj_1.body, contact.obj_2.body)
            end
        }
    end

    def add_contact(contact)
        @contacts << contact
    end
end