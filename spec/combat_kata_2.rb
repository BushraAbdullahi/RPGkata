class Character
    def initialize(name)
        @name = name
        @health = 1000
        @isAlive = true
    end

    def health 
        @health
    end

    def isAlive 
        @isAlive
    end
 
    def receive_damage(attacker, damagePoints)
        # TODO: implement this functionality
    end

    def to_s
        # "This is the Printer you need to implement so that you can see what happens to a character during combat"
    end
end

class Move
    """abstract interface to use a superclass"""

    def play(characters)
    end
end

class DealDamage < Move
    def initialize(attacker_name, defender_name, amount)
        @attacker_name = attacker_name
        @defender_name = defender_name
        @damagePoints = amount
    end
    
# translate play method from the original python code
    def play(characters)
        attacker = characters[@attacker_name]
        defender = characters[@defender_name]
        defender.receive_damage(attacker, @damage_points)
    end

    def to_s
        # This is the Printer you need to implement so that you can see what moves happen during combat
    end
end

def play(characters, move)
    move.play(characters)
end
