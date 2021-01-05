class PartyDrink < ApplicationRecord
	belongs_to :drink
	belongs_to :party
end