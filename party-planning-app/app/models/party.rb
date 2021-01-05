class Party < ApplicationRecord
	has_many :user_parties
	has_many :users, through: :user_parties
	has_many :party_foods
	has_many :foods, through: :party_foods
	has_many :party_drinks
	has_many :drinks, through: :party_drinks
	has_many :party_activities
	has_many :activities, through: :party_activities

	accepts_nested_attributes_for :activities, :drinks, :foods

	validates :name, uniqueness: true, presence: true
	validates :time, presence: true
	validates :date, presence: true
	validates :location, presence: true

	validate :date_cannot_be_in_the_past
	validate :address_validation

	def date_cannot_be_in_the_past
	    if date.present? && DateTime.parse(date) < Date.today
	      errors.add(:date, "can't be in the past")
	    end
	end

	def address_validation
		if location.present? && !(/\s[a-zA-Z]{2}\s\d{5}\z/).match?(location) && location.length < 12
			errors.add(:location, "must be a valid US address.")
		end
	end

	def self.party_organizer(current_user)
		where(organizer: current_user.name)
	end	

	def activities_attributes=(activity)
		self.activities << Activity.find_or_create_by(name: activity[:name])
	end

end