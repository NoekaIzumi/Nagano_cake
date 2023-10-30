class Customer::CartItemsController < ApplicationController

  def index
    if customer_signed_in?
     @customer = Customer.find(current_customer.id)
     @cart_items = @customer.cart_items
     @sum = 0
    else
    redirect_to new_customer_session_path
    end
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.item_id = cart_item_params[:item_id]

    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      redirect_to customer_cart_items_path
    else
      cart_item.save!
      redirect_to customer_cart_items_path
    end
  end

  def update

  cart_item = CartItem.find(params[:id])
  cart_item.update(amount: params[:cart_item][:amount].to_i)
  redirect_to customer_cart_items_path

  end



  def destroy
   cart_item = CartItem.find(params[:id])
   cart_item.destroy
   redirect_to customer_cart_items_path
  end

  def destroy_all
   CartItem.destroy_all
   redirect_to customer_cart_items_path
  end

  def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount,:cart_item_id)
  end

end
