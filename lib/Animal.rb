class Animal
    @@all = []
    attr_reader :location, :name

  def initialize(name, location)
    @name = name
    @location = location
    @@all << self
  end

  def self.all
    @@all
  end

  def animals
    Animal.all.select do |animal|
      self == animal.zoo
    end
  end

  def animal_species
    animal_array = self.animals.map {|animal| animal.species}
    animal_array.uniq
  end

  def animal_nicknames
    animals.map {|animal| animal.nickname}
  end

  def find_by_species(speciesArg)
    self.animals.select do |animal|
      animal.species == speciesArg
    end
  end

  def self.find_by_location(locationArg)
    @@all.select do |zoo|
      zoo.location == locationArg
    end
  end
end
