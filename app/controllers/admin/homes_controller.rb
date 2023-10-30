class Admin::HomesController < ApplicationController

  def top
   if admin_signed_in?
    @orders = Order.all
    @order_items = OrderItem.where(order_id: @orders.pluck(:id))
   else
    redirect_to new_admin_session_path
   end
  end


private

  def order_params
    params.require(:order).permit(:customer_id, :total_amount, :shipping_fee, :payment_method, :address, :name, :postcode)
  end

  def order_item_params
  params.require(:order_item).permit(:item_id, :order_id, :price,:quantity)
  end



end
