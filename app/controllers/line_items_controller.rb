class LineItemsController < ApplicationController
  def create

    if current_user.current_cart_id
      current_cart = Cart.find(current_user.current_cart_id)
    else
      current_cart = Cart.create!
      current_user.current_cart_id = current_cart.id
      current_cart.user_id = current_user.id
      current_cart.save
      current_user.save
    end

    current_cart.add_item(params[:item_id])
    current_cart.save

    redirect_to cart_path(current_cart)
  end

end
