class Character

	attr_reader :breed
	attr_accessor :strength, :charisma

  def initialize(breed)
    @breed = breed
    @strength = 0
    @charisma = 0
  end

  def attack(character)
  end

end

walter = Player.new("Human")
danny = Player.new("PVGV")

puts walter.breed
puts danny.breed

puts walter.strength
walter.strength = 2

puts walter.strength