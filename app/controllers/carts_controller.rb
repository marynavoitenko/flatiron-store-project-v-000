class CartsController < ApplicationController
  def show
    @current_cart = current_user.current_cart
  end

  def checkout
    cart = Cart.find(params[:id])

    cart.checkout

    current_user.current_cart = nil
    current_user.save

    redirect_to cart_path(cart)
  end

end
