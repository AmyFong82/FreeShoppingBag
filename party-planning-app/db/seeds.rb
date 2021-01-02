# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |i|
    User.create(first_name: "User-#{i+1}", last_name: "Name", phone: "111-222-333#{i}", email: "#{i+1}@email.com", password: "#{i+1}")
  	Party.create(organizer: "User-#{i+1} Name", name: "Party-#{i+1}", 
  				date: "1/#{i+1}/2021", time: "2:00pm", 
  				location: "#{i+1} Benson Avenue, Brooklyn, NY 11229",
  				food_id: i+1,
  				drink_id: i+1,
  				activity_id: i+1,
  				snack_id: i+1
  				)

  	Food.create(name: "Dish-#{i+1}", party_id: i+1)
  	Snack.create(name: "Snack-#{i+1}", party_id: i+1)
  	Activity.create(name: "Activity-#{i+1}", party_id: i+1)
  	Drink.create(name: "Drink-#{i+1}", party_id: i+1)
end

UserParty.create(user_id: 1, party_id: 1)
UserParty.create(user_id: 2, party_id: 2)
UserParty.create(user_id: 3, party_id: 3)
UserParty.create(user_id: 4, party_id: 4)
UserParty.create(user_id: 5, party_id: 5)

UserParty.create(user_id: 1, party_id: 2)
UserParty.create(user_id: 2, party_id: 3)
UserParty.create(user_id: 3, party_id: 4)
UserParty.create(user_id: 4, party_id: 5)
UserParty.create(user_id: 5, party_id: 1)

