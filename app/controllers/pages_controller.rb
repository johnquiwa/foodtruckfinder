class PagesController < ApplicationController

	def home
	end

	def about
	end
	
	def search
		@cart = Cart.all
	end
end
