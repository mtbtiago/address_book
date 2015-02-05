# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..50).each do 
  p = Person.create(
    name: Faker::Name.name, 
    address: Faker::Address.street_address)
  i = rand(3)+1
  (1..i).each do
    p.phones.create(address: Faker::PhoneNumber.phone_number)
  end
  i = rand(2)+1
  (1..i).each do
    p.emails.create(address: Faker::Internet.email)
  end
end
