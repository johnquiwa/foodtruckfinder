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
		if params[:search].present?
    		@carts = Cart.near(params[:search], 1)
    		@hash = Gmaps4rails.build_markers(@carts) do |cart, marker|
	  			marker.lat cart.latitude
	  			marker.lng cart.longitude
	  			marker.infowindow render_to_string(:partial => "infowindow", :locals => { :cart => cart})
	  			marker.json({ titre: cart.name, 
	  						address: cart.address
	  						})
  				end	
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
