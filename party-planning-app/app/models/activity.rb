class Activity < ApplicationRecord
	belongs_to :party
	has_many :votes
	has_many :users, through: :votes
end