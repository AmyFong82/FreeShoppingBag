class Party < ApplicationRecord
	has_many :users
	has_many :snacks
	has_many :food
	has_many :drinks
	has_many :activities

end