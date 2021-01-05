class Drink < ApplicationRecord
	has_many :party_drinks
	has_many :parties, through: :party_drinks

	validates :name, uniqueness: true
end