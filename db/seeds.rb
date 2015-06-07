# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [ "Gifts", "Home", "Garden", "Prints and Art", "Jewellry", "Fashion", "Baby and Child", "Weddings", "Food and Drink", "Health and Beauty", "Pets" ]

categories.each do |category|
  Category.create(name: category)
end

