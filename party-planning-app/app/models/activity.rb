class Activity < ApplicationRecord
	has_many :votes
	has_many :parties
	has_many :users, through: :parties

	validates :name, uniqueness: true
end