class User < ApplicationRecord
	has_many :tickets
	has_many :parties, through: :tickets

	has_secure_password

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, uniqueness: true
	validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "must match the required format." }

	def name
		self.first_name + " " + self.last_name
	end

	def num_of_parties
		num = self.parties.count
		if num == 0
			"Check out our parties to join."
		else
			"You have #{num} " + 'party'.pluralize(num) + " coming up:"
		end
	end

	def num_of_parties_organized(current_user)	
		num = Party.party_organizer(current_user).count
		if num > 0
			"You organized #{num} " + "party".pluralize(num) + ":"
		end
	end

end