class User < ApplicationRecord
	has_many :parties
	has_many :votes
	has_many :drinks, though: :parties
	has_many :snacks, though: :parties
	has_many :food, though: :parties
	has_many :activities, though: :parties

	
end