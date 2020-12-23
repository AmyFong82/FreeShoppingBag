class User < ApplicationRecord
	has_many :user_parties
	has_many :parties, through: :user_parties
	has_many :votes
	has_many :drinks, through: :parties
	has_many :snacks, through: :parties
	has_many :food, through: :parties
	has_many :activities, through: :parties

	has_secure_password

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, uniqueness: true
	validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "must match the required format." }

end