# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

User.destroy_all
Post.destroy_all

# Create 100 users
100.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )

  # Create between 1 and 10 posts for each user
  rand(1..10).times do
    Post.create(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      user: user
    )
  end
end

puts "Seeded #{User.count} users and #{Post.count} posts."
