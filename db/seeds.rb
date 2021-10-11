# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting ownings"
Owning.delete_all
puts "deleting sheeps"
Sheep.delete_all
puts "deleting users"
User.delete_all
puts "deleting fields"
Field.delete_all

User.create!(
  email: "moutmout@gmail.com",
  password: "123123"
)

3.times do |i|
  puts "creating field #{i+1}"
  Field.create!(
    name: "maynet-#{i+1}"
  )

  puts "creating ownings between field and user"
  Owning.create!(
    field_id: Field.last.id,
    user_id: User.last.id
  )

  puts "adding 3 sheeps to the field"
  3.times do
    Sheep.create!(
      field: Field.last,
      genre: ["male", "female"].sample,
      age: (1..2).to_a.sample,
      weight: (30..40).to_a.sample
    )
  end
end
