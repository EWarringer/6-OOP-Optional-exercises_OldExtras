class Ingredient
  attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight / 1000.0
  end
end

class Container
  attr_reader :weight, :maximum_holding_weight, :ingredients

  def initialize(weight, maximum_holding_weight, ingredients)
    @weight = weight
    @maximum_holding_weight = maximum_holding_weight
    @ingredient = ingredients
  end

  def self.filled(ingredient)
    if ingredient.name == "Cheesy Poof"
      weight = 20
      maximum_holding_weight = 10
    else
      weight = 90
      maximum_holding_weight = 140
    end
    ingredient_quantity = (maximum_holding_weight / ingredient.weight).to_i
    ingredients = []
    ingredient_quantity.times do
      ingredients << ingredient
    end
    Container.new(weight, maximum_holding_weight, ingredients)
  end

  def ingredient_name
    ingredients.first.name
  end

  def ingredient_weight
    ingredients.first.weight
  end

  def total_weight
    weight + ingredients.count * ingredient_weight
  end
end

class Airplanes
  attr_reader :carrying_capacity
  def initialize(carrying_capacity, containers)
    @carrying_capacity = carrying_capacity
    @containers = containers
  end

  def self.loaded(carrying_capacity, cheesy_poof_weight)
    cheesy_poof = Ingredient.new("Cheesy Poof", 0.5)
    cheesy_poof_container = Container.filled(cheesy_poof)
    brussels_sprout = Ingredient.new("Brussels Sprout", 20)
    cheesy_poof_container = Container.filled(brussels_sprout)

    cheesy_poof_container_quantity = (cheesy_poof_weight / cheesy_poof_container.total_weight).to_i
    burssels_sprout_container_quantity = ((carrying_capacity - cheesy_poof_weight) / cheesy_poof_container.total_weight).to_i

    Airplane.new(carrying_capacity, containers)
  end
end
