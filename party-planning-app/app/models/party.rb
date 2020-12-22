class Party < ApplicationRecord
	has_many :user_parties
	has_many :users, through: :user_parties
	has_many :snacks
	has_many :food
	has_many :drinks
	has_many :activities

end