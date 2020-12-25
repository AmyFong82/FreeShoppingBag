# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |i|
    User.create(first_name: "User-#{i}", last_name: "Name", phone: "111-222-333#{i}", email: "#{i}@email.com", password: "#{i}")
  	Party.create(name: "#{i+1}-Party", date: "1/#{i+1}/2021", time: "2:00pm", location: "#{i+1} Benson Avenue, Brooklyn, NY 11229")
  	Food.create(name: "Dish-#{i+1}")
  	Snack.create(name: "Snack-#{i+1}")
  	Activity.create(name: "Activity-#{i+1}")
  	Drink.create(name: "Drink-#{i+1}")
end

    UserParty.create(party_id: 1, user_id: 1)
    UserParty.create(party_id: 1, user_id: 2)
    UserParty.create(party_id: 2, user_id: 1)
    UserParty.create(party_id: 2, user_id: 3)



