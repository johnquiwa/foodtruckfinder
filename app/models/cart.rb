class Cart < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode
	def self.search(search)
	  where("name LIKE ?", "%#{search}%") 
	  where("address LIKE ?", "%#{search}%")
	end
end