# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |i|
    User.create(first_name: "User-#{i+1}", last_name: "Name", 
      phone: "111-222-333#{i}", email: "#{i+1}@email.com", password: "#{i+1}")
end

#create 7 party categories
Category.create(name: "Birthday")
Category.create(name: "Dance")
Category.create(name: "Block")
Category.create(name: "Pool")
Category.create(name: "Graduation")
Category.create(name: "Welcome")
Category.create(name: "Farewell")


6.times do |i|
  Party.create(name: "Party-#{i}", date: "2/#{i+1}/2021", time: "2:00pm", 
  	location: "#{i+1} Benson Avenue, Brooklyn, NY 11229", organizer: "User-#{i} Name", category_id: i+1,
  	description: "Party description here.")
end

#create 5 tickets for 5 parties
Ticket.create(user_id: 1, party_id: 1, num_of_attendees: 1)
Ticket.create(user_id: 2, party_id: 2, num_of_attendees: 1)
Ticket.create(user_id: 3, party_id: 3, num_of_attendees: 1)
Ticket.create(user_id: 4, party_id: 4, num_of_attendees: 1)
Ticket.create(user_id: 5, party_id: 5, num_of_attendees: 1)
Ticket.create(user_id: 1, party_id: 2, num_of_attendees: 3)
Ticket.create(user_id: 2, party_id: 3, num_of_attendees: 2)
Ticket.create(user_id: 3, party_id: 4, num_of_attendees: 4)
Ticket.create(user_id: 4, party_id: 5, num_of_attendees: 3)
Ticket.create(user_id: 5, party_id: 1, num_of_attendees: 1)

