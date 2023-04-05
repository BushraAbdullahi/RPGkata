

describe 'levels' do
    it "should have a character, when created, start at level 1" do
        alice = Character.new("Alice")
        expect(alice.level).to be 1
    end
   
    it "a character can change levels" do
      alice = Character.new("Alice")
      alice.setLevel(6)
      expect(alice.level).to be 6
    end

    it "when a character reaches level 6, their max health becomes 1500" do
        alice = Character.new("Alice")
        alice.setLevel(6)
        expect(alice.health).to be 1500
    end

    it "If the target is 5 or more Levels above the attacker, Damage is reduced by 50%" do
        alice = Character.new("Alice")
        bob = Character.new("Bob")
        alice.setLevel(6)
        alice.receive_damage(bob,100)
        expect(alice.health).to be 1450
    end

    it "If the target is 5 or more Levels below the attacker, Damage is increased by 50%" do
        alice = Character.new("Alice")
        bob = Character.new("Bob")
        bob.setLevel(6)
        alice.receive_damage(bob,100)
        expect(alice.health).to be 850
    end
end

