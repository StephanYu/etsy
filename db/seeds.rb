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

# Listing.create(...., image =File.open('http://dropbox/'))
# listings = [
#   {
#     name:
#     description:
#     price:
#     image_file_name:
#     image_content_type:
#     image_file_size:
#     user_id:
#     category_id:
#   },
#   {
#     name:
#     description:
#     price:
#     image_file_name:
#     image_content_type:
#     image_file_size:
#     user_id:
#     category_id:
#   },
#   {
#     name:
#     description:
#     price:
#     image_file_name:
#     image_content_type:
#     image_file_size:
#     user_id:
#     category_id:
#   },
#   {
#     name:
#     description:
#     price:
#     image_file_name:
#     image_content_type:
#     image_file_size:
#     user_id:
#     category_id:
#   },
#   {
#     name:
#     description:
#     price:
#     image_file_name:
#     image_content_type:
#     image_file_size:
#     user_id:
#     category_id:
#   },
#   {
#     name:
#     description:
#     price:
#     image_file_name:
#     image_content_type:
#     image_file_size:
#     user_id:
#     category_id:
#   }
# ]