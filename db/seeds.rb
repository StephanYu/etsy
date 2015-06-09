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

User.create(first_name: "Stephan", last_name: "Yu", email: "stephan.yu@gmail.com", password: "12345678", password_confirmation: "12345678")


# u = User.new({:name => 'username', :email => 'user@name.fr'...})
# u.avartar = File.open('/Users/myAccount/avatars/user.png')
# u.save!
# Listing.create(...., image =File.open('http://dropbox/'))

listings = [
  {
    name: "Test",
    description: "Test description",
    price: 100,
    image: File.open("https://dl.dropboxusercontent.com/1/view/wwlnr96k58yxvk9/Apps/Etsyreborn/original/1_normal_colour-flash-monogrammed-cushion.jpg"),
    user_id: 1,
    category_id: 1
  }
]

listings.each do |listing|
  Listing.create(
    name: listing.name,
    description: listing.description,
    price: listing.price,
    image: listing.image,
    user_id: listing.user_id,
    category_id: listing.category_id
  )
end
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