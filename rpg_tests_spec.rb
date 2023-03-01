require 'combat_kata'

describe Character do
    describe 'receive_damage' do
        let(:character) { Character.new("Alice", 1000, true) }
        let(:attacker) { Character.new("Bob", 950, true) }
        let(:damage_points) { 50 }
        
        it 'should output stats of Alices character' do
            expect(character.to_s).to eq "Name = Alice, Health = 1000, Alive? = true"
        end
        
        it 'should decrease the health of the character' do
            character.receive_damage(attacker, damage_points)
            expect(character.to_s).to eq "Name = Alice, Health = 950, Alive? = true"
        end

        it 'should show the character is dead once the health is at 0' do
            for i in 1..20 do
                character.receive_damage(attacker, damage_points)
            end
            expect(character.to_s).to eq "Name = Alice, Health = 0, Alive? = false"

        end

        it 'should not deal damage when a character attacks itself'do
            character.receive_damage(character, damage_points)
            expect(character.to_s).to eq "Name = Alice, Health = 1000, Alive? = true"
        end
    end
end

describe DealDamage do
    describe 'deal damage' do
        let(:attacker) { Character.new("Bushra", 1000, true) }
        let(:defender) { Character.new("Megan", 1000, true) }
        let(:dealdamage) {DealDamage.new("Bushra", "Megan", 50)}

        let(:characters) {{ "Bushra": attacker, "Megan": defender}}
      
        it 'should allow the attacker to deal damage to the defender' do
            dealdamage.play(characters)
            expect(defender.to_s).to eq "Name = Megan, Health = 950, Alive? = true"
        end
    end
end



