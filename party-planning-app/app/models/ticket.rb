class Ticket < ApplicationRecord
	belongs_to :user
	belongs_to :party

	validates :num_of_attendees, numericality: { only_integer: true, greater_than: 0 }

end