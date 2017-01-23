require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "recipes")
    yield(connection)
  ensure
    connection.close
  end
end

class Recipe
  attr_reader :id, :name, :instructions, :description
  def initialize(id, name, instructions, description)
    @id = id
    @name = name
    @instructions = instructions
    @description = description
  end
  def self.all
    array = []
    recipes = db_connection {|conn| conn.exec("SELECT * FROM recipes;")}
    recipes.each do |recipe|
      array << Recipe.new(recipe["id"], recipe["name"], recipe["instructions"], recipe["description"])
    end
    array
  end

  def self.find(id)
    recipe = db_connection {|conn| conn.exec("SELECT * FROM recipes WHERE id = #{id};")}
    new_recipe = Recipe.new(recipe[0]["id"], recipe[0]["name"], recipe[0]["instructions"], recipe[0]["description"])
    new_recipe
  end
end
