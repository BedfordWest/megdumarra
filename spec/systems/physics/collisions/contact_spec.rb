require 'rspec'
require_relative '../../../../systems/physics/collisions/contact.rb'
require_relative '../../../../systems/physics/bodies/fixture.rb'
require_relative '../../../../systems/physics/bodies/body.rb'

describe Contact do
    def set_body_mock()
        body = double(Body)
        allow(body).to receive(:is_a?).and_return(false)
        allow(body).to receive(:is_a?).with(Body).and_return(true)
        allow(body).to receive(:class).and_return(Body)
        body
    end
    def set_fixture_mock()
        fixture = double(Fixture)
        allow(fixture).to receive(:is_a?).and_return(false)
        allow(fixture).to receive(:is_a?).with(Fixture).and_return(true)
        allow(fixture).to receive(:class).and_return(Fixture)
        fixture
    end

    describe '#initialize' do
        let(:body1) { set_body_mock }
        let(:body2) { set_body_mock }
        let(:fixture1) { set_fixture_mock }
        let(:fixture2) { set_fixture_mock }                
        it 'fails for differing types' do
            expect { contact = Contact.new(body1, fixture1)}.to raise_error(ArgumentError)
        end
        it 'fails for non-physics types' do
            not_a_physics_type = Object.new
            expect { contact = Contact.new(not_a_physics_type, not_a_physics_type)}.to raise_error(ArgumentError)
        end
        it 'raises no errors for two bodies' do
            expect { contact = Contact.new(body1, body2)}.not_to raise_error
        end
        it 'raises no errors for two fixtures' do
            expect { contact = Contact.new(fixture1, fixture2)}.not_to raise_error
        end
        it 'is a first contact when initialized' do
            contact = Contact.new(body1, body2)
            expect(contact.first).to be true
        end
    end

    describe '#contains?' do
        let(:body1) { set_body_mock }
        let(:body2) { set_body_mock }
        let(:body3) { set_body_mock }
        let(:contact) { Contact.new(body1, body2) }
        it 'is true if contact contains the first object' do
            expect(contact.contains?(body1)).to be true
        end
        it 'is true if contact contains the second object' do
            expect(contact.contains?(body2)).to be true
        end
        it 'is false if contact does not contain the object' do
            expect(contact.contains?(body3)).to be false
        end
        it 'raises an error if passed object is not a physics object' do
            object = Object.new
            expect { contact.contains?(object) }.to raise_error(ArgumentError)
        end
    end
end