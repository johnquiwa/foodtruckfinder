class Cart < ActiveRecord::Base
	def self.search(search)
	  where("name LIKE ?", "%#{search}%") 
	  where("address LIKE ?", "%#{search}%")
	end
end