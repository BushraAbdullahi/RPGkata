require_relative  '../combat_kata'

describe "character factions" do
    it "a newly created character belongs to no faction" do
        newCharacter = Character.new("Me")
        expect(newCharacter.factions.empty?).to be true
    end

    it "a character can belong to one faction" do
        newCharacter = Character.new("Me")
        newCharacter.joinFaction("Faction1")
        expect(newCharacter.factions).to include "Faction1"
    end

    it "a character can belong to multiple factions" do
        newCharacter = Character.new("Me")
        newCharacter.joinFaction("Faction1")
        newCharacter.joinFaction("Mushroom Kingdom")
        expect(newCharacter.factions).to include "Mushroom Kingdom"
        expect(newCharacter.factions).to include "Faction1"
        
    end

    it "a character can leave one or more factions" do
      newCharacter = Character.new("Me")
      newCharacter.joinFaction ("Faction1")
      newCharacter.joinFaction ("Mushroom Kingdom")
      newCharacter.leaveFaction("Faction1")
      expect(newCharacter.factions).to include "Mushroom Kingdom"
      expect(newCharacter.factions).not_to include "Faction1"
    end

    it "Players belonging to the same Faction are considered Allies" do
        newCharacter = Character.new("Me")
        newCharacter2 = Character.new("You")
        newCharacter.joinFaction ("Faction1")
        newCharacter2.joinFaction ("Faction1")
        expect(newCharacter.isAlliesWith(newCharacter2)).to be true
    end

    it "Allies cannot Deal Damage to one another." do
        newCharacter = Character.new("Me")
        newCharacter2 = Character.new("You")
        newCharacter.joinFaction ("Faction1")
        newCharacter2.joinFaction ("Faction1")
        newCharacter.receive_damage(newCharacter2,100)
        expect(newCharacter.health).to be 1000
    end

    it "Allies can Heal one another." do
        me = Character.new("Me")
        you = Character.new("You")
        healer = Character.new("Healer")

        me.joinFaction ("Faction1")
        healer.joinFaction ("Faction1")
        you.joinFaction ("Faction2")

        me.receive_damage(you,100)
        me.healed_by(healer)

        expect(me.health).to be 1000
    end

    it "non-allies cannot heal each other" do
        me = Character.new("Me")
        you = Character.new("You")

        me.joinFaction ("Faction1")
        you.joinFaction ("Faction2")

        me.receive_damage(you,100)
        me.healed_by(you)

        expect(me.health).to be 900
    end
end