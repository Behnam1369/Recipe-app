# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(email: 'lily@gmail.com', password: '123456', confirmed_at: DateTime.now, name: 'lily')

food = Food.create(name: 'chicken wings', measurement_unit: 'kg', price: '10', user_id: user.id)
recipe = Recipy.create(name: 'fried chicken', preparation_time: '1 hour', cooking_time: '2 hours', description: 'Just some fried chicken wings', public: true, user_id: user.id)
recipe_food = RecipyFood.create(quantity: 2, recipy_id: recipe.id, food_id: food.id)