module Placeholder
	extend ActiveSupport::Concern

# using keyword arguments
	def self.image_generator(height:, width:)
		"http://via.placeholder.com/#{height}x#{width}"
	end
end