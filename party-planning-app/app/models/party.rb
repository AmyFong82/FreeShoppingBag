class Party < ApplicationRecord
	has_many :user_parties
	has_many :users, through: :user_parties
	has_many :snacks
	has_many :foods
	has_many :drinks
	has_many :activities
	has_many :votes

	validate :address_validation

	validates :name, uniqueness: true


	def address_validation
		if location.present? && !(/\s[a-zA-Z]{2}\s\d{5}\z/).match?(location)
			errors.add(:location, "must be a valid US address.")
		end
	end

end