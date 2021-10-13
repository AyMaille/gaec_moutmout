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

puts "creating seller"
vendeur = Field.create!(
    name: "vendeur"
  )

puts "creating mother0"
mother_zero = Sheep.create!(
  field: vendeur,
  genre: "female",
  age: 30,
  weight: (30..40).to_a.sample,
  pregnant: false,
  expected_lambs: 0,
  kind: "brebis",
  mother_id: 1,
  status: "alive"
  )

5.times do |i|
  puts "creating field #{i + 1}"
  Field.create!(
    name: "maynet-#{i + 1}"
  )

  puts "creating ownings between field and user"
  Owning.create!(
    field_id: Field.last.id,
    user_id: User.last.id
  )

  puts "adding 10 sheeps to the field"
  10.times do
    Sheep.create!(
      field: Field.last,
      genre: ["male", "female"].sample,
      age: (1..2).to_a.sample,
      weight: (30..40).to_a.sample,
      pregnant: false,
      expected_lambs: 0,
      kind: ["bélier", "jeune", "brebis"].sample,
      mother_id: mother_zero.id,
      status: "alive"
    )
  end
end
