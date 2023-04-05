require_relative  '../combat_kata'

describe 'making_characters' do
    it 'should exist when I make one (ie. not be null or something)' do
        alice = Character.new("Alice")
        expect(alice).should_not be_nil 
    end
    it 'should have a health of 1000 when a character is created' do
        bob = Character.new("Bob")
        expect(bob.health).to eq 1000
        expect(bob.max_health).to eq 1000
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
        expect(alice.receive_damage(bob,50)).to be 950
        expect(alice.health).to be 950
    end

    it 'When damage received exceeds current Health, Health becomes 0 and the character dies' do
        alice = Character.new("Alice")
        bob = Character.new("Bob")
        alice.receive_damage(bob,2000)
        expect(alice.health).to be 0
        expect(alice.isAlive).to be false
    end

    it "When the damage equals the current health, the character should still be alive" do
        alice = Character.new("Alice")
        bob = Character.new("Bob")
        alice.receive_damage(bob,1000)
        expect(alice.health).to be 0
        expect(alice.isAlive).to be true
    end

    it "A Character cannot Deal Damage to itself" do
        alice = Character.new("Alice")
        alice.receive_damage(alice,100)
        expect(alice.health).to be 1000
    end

    it "A Character can Heal themselves" do
        alice = Character.new("Alice")
        alice.receive_damage(alice,100)
        alice.heal_itself
        expect(alice.health).to be 1000
    end

    it "A dead character cannot heal themselves" do
        alice = Character.new("Alice")
        bob = Character.new("Bob")
        alice.receive_damage(bob,1001)
        alice.heal_itself
        expect(alice.health).to be 0
    end

end
