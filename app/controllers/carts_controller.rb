class CartsController < ApplicationController
	def new
		@cart = Cart.new
	end

	def create
		@cart = Cart.new(cart_params)
		if @cart.save
			flash[:success] = "Cart created!"
			redirect_to carts_path
		else
			flash[:danger] = "There was an error in listing this cart!"
			redirect_to new_cart_path
		end
	end

	def index
		@cart = Cart.all
		if params[:search]
    		@carts = Cart.search(params[:search]).order("created_at DESC")
  		else
    		@carts = Cart.all.order('created_at DESC')
  		end
	end

	def edit
	end

	def update
	end

	private
		def cart_params
			params.require(:cart).permit(:name, :address)
		end
end
