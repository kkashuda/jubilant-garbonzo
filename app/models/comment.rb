class Comment < ApplicationRecord
	belongs_to :pin 

	def self.to_time(time) 
		return time.to_formatted_s(:short) 
	end 

end 
