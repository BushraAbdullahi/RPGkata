describe 'magical objects' do
    it 'We have magical objects' do
        myMagicalObject = MagicalObject.new("Healing Potion")
        expect(myMagicalObject).should_not be_nil
    end

    it 'has health' do 
        myMagicalObject = MagicalObject.new("Healing Potion")
        expect(myMagicalObject.health).should_not be_nil
    end

    it 'maximum health is fixed' do
        myMagicalObject = MagicalObject.new("Healing Potion")
        expect(myMagicalObject.max_health).to eq 1000
        expect(myMagicalObject.health).to eq myMagicalObject.max_health
    end 

    it "if health is reduced to zero then object is destroyed" do
        myMagicalObject = MagicalObject.new("Healing Potion")
        myMagicalObject.reduced_health(1000)
        expect(myMagicalObject.is_destroyed).to be true
    end

end



