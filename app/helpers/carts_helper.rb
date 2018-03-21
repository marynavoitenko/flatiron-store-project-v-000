module CartsHelper
  def current_cart
    if current_user.current_cart
      @current_cart = current_user.current_cart
    else
      @current_cart = current_user.carts.where("status = ?", "submitted").last
    end
  end
end
