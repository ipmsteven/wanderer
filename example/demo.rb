require 'wanderer'

class Animal
  def initialize(name)
    @name = name
  end

  def info
    puts "I'm a #{self.class}."
    puts "My name is '#{@name}'."
  end
end

class Dog < Animal
  def info
    puts "I #{make_noise}."
    super
  end

  def make_noise
    'bark "Woof woof"'
  end
end

lassie = Dog.new "Lassie"

routes = Wanderer.walk(lassie, :info)

puts routes.join("\n")
