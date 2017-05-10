# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pets = [
  {
    name: "Peanut",
    age: 2,
    person_id: 1
  },
  {
    name: "Horsetooth",
    age: 14,
    person_id: 2
  },
  {
    name: "Beansprout",
    age: 1,
    person_id: 2
  }
]

pets.each do |pet|
  Pet.create(pet)
end


people = [
  {
    name: "Katherine"
  },
  {
    name: "Grace"
  }
]

people.each do |person|
  Person.create(person)
end
