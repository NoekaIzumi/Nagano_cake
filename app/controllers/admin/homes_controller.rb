class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @order_items = OrderItem.where(order_id: @orders.pluck(:id))
  end
  
  
private

  def order_params
    params.require(:order).permit(:customer_id, :total_amount, :shipping_fee, :payment_method, :address, :name, :postcode)
  end  
  
  def order_item_params
  params.require(:order_item).permit(:item_id, :order_id, :price,:quantity)
  end



end
