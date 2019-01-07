class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end
end

john = Person.new("John")
john.name = "Jim"
puts john.name # => Jim