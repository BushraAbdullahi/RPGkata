require 'combat_kata_2'

describe 'making_characters' do
    it 'should exist when I make one (ie. not be null or something)' do
        alice = Character.new("Alice")
        expect(alice).should_not be_nil 
    end
    it 'should have a health of 1000 when a character is created' do
        bob = Character.new("Bob")
        expect(bob.health).to eq 1000
    end
    it 'should be alive when a character is created' do
        bob = Character.new("Bob")
        expect(bob.isAlive).to eq true
    end

end

describe 'dealing_damage' do
    it 'should decrease the health of the character' do
        alice = Character.new("Alice")
        bob = Character.new("Bob")
        expect(alice.health).to be 1000
        alice.receive_damage(bob,50)
        expect(alice.health).to be 950
    end
end