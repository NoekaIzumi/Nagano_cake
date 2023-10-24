class Customer::OrderItemsController < ApplicationController

  def create
     order_item = OrderItem.new(order_item_params)
  end

  private

  def order_item_params
  params.require(:order_item).permit(:item_id, :order_id, :price,:quantity)
  end

end
