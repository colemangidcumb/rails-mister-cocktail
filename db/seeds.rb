# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require 'open-uri'
require 'json'

Ingredient.destroy_all
puts 'starting seed'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = URI.parse(url).open.read
results = JSON.parse(response)
ingredients = results['drinks']

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
  puts "created #{ingredient['strIngredient1']}"
end
Cocktail.create(name: 'old fashioned')
Cocktail.create(name: 'martini')
Cocktail.create(name: 'fuzzy navel')
