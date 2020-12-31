class Drink < ApplicationRecord
	has_many :votes
	has_and_belongs_to_many :parties
	has_many :users, through: :parties

	validates :name, uniqueness: true
end