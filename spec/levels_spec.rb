require_relative  '../combat_kata'

describe "character levels" do
    it "should have a character, when created, start at level 1" do
        alice = Character.new("Alice")
        expect(alice.level).to be 1
    end
end

