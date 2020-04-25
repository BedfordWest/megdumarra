module PlayerContacts
    def player_contact(contact)
        player = contact.obj_2.entity
        player.hit = true
    end
end