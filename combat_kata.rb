# Options for handling/tracking max health
# OPtion 1: add variable to Character to track max health
# Option 2: Let the level (now an object) handle the max health
class Character
    def initialize(name)
        @name = name
        @health = 1000 
        @max_health = 1000
        @isAlive = true
        @level = 1
        @factions = []
    end

    def health 
        @health
    end

    def max_health
        @max_health
    end

    def level
        @level
    end

    def setLevel(level)
        @level = level
        if level >= 6 
            @health = 1500
            @max_health = 1500
        end

    end

    def isAlive 
        @isAlive
    end

    def factions
        @factions
    end

    def joinFaction(faction)
        @factions << faction
    end

    def leaveFaction(faction)
        @factions.delete(faction)
    end

    def isAlliesWith(character)
        matchingFactions = @factions & character.factions
        !matchingFactions.empty?
    end
    
    def check_conditions(method, character)
        if method == "heal_itself"
            if self.isAlive && @health < @max_health
                return true
            end
        elsif method == "healed_by"
            if self.isAlive && @health < @max_health && self.isAlliesWith(character)
                return true
            end
        end
    end

    def heal_itself
        if check_conditions("heal_itself", nil)
            @health = max_health
        end
    end

    def healed_by(character)
        if check_conditions("healed_by", character) 
            @health = max_health
        end
    end

    def calculateDamageFromAttacker(attacker,points)
        if (self.level - attacker.level <= -5)
            points = points*1.5
        elsif (self.level - attacker.level >= 5)
            points = points*0.5
        end
        @health = @health-points.to_i
        
    end

    def receive_damage(attacker, damagePoints)
        if self != attacker && !self.isAlliesWith(attacker)
            if (damagePoints > @health)
                @health = 0
                @isAlive = false
            else
                calculateDamageFromAttacker(attacker,damagePoints)
            end
        end
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
