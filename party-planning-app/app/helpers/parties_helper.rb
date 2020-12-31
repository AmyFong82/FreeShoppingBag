module PartiesHelper

	def date_reformatted(party)
		party.date.to_date.strftime("%A, %b %d, %Y")
	end

	def time_format(party)
	  party.time.to_time.strftime("%l:%M %p")
	end

end