class User < ApplicationRecord
	has_many :tickets
	has_many :parties, through: :tickets

	has_secure_password

	validates :email, uniqueness: true, allow_nil: true

	def num_of_parties
		num = self.parties.count
		"You have #{num} " + 'party'.pluralize(num) + " coming up:"
	end

	def num_of_parties_organized(current_user)	
		num = Party.party_organizer(current_user).count
		if num > 0
			"You organized #{num} " + "party".pluralize(num) + ":"
		end
	end

end