class Food < ApplicationRecord
	has_many :party_foods
	has_many :parties, through: :party_foods

	validates :name, uniqueness: true
end