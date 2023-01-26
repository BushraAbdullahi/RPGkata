class Character
    def initialize(name, health, isAlive)
        @name = name
        @health = health
        @isAlive = isAlive
    end
    
    def name
        @name
    end

    def receive_damage(attacker, damagePoints)
        # TODO: implement this functionality
        if attacker.name != @name
            @health -= damagePoints
        end
        if @health == 0
            @isAlive = false
        end
    end

    def to_s
        # "This is the Printer you need to implement so that you can see what happens to a character during combat"
        "Name = #{@name}, Health = #{@health}, Alive? = #{@isAlive}"
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

    def play(characters)
        attacker = characters[@attacker_name]
        defender = characters[@defender_name]
        defender.receive_damage(attacker, @damagePoints)
    end

    def to_s
        "This is the Printer you need to implement so that you can see what moves happen during combat"
        "Name = #{@name}, Health = #{@health}, Alive? = #{@isAlive}"
    end
end

def play(characters, move)
    move.play(characters)
end