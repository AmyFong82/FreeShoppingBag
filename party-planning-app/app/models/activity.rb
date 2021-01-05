class Activity < ApplicationRecord
	has_many :party_activities
	has_many :parties, through: :party_activities
end