require 'combat_kata'
# Damage and Health

# how do we interact with this function? Inputs and Outputs?
# health starts at 1000
# Start with Alive, can be Dead
# When are magical objects (Healing and Weapons) available to our characters - after a certain amount time?
# Track time passing with input to function, count the number of inputs (i.e. after 10, then make random object available)

# describe "Damage and Health" do
#     it "when character is level 1, their health is a max of 1000"
#     end
# end


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

        it ''
    

    end
end


