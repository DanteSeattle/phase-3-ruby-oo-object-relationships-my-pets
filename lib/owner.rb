class Owner

  attr_reader :name
  attr_reader :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    return @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    Cat.all.each{
      |cat| cat.mood = "nervous"
      cat.owner = nil}
    Dog.all.each{
      |dog| dog.mood = "nervous"
      dog.owner = nil}
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
