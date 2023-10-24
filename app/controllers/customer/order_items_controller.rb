class Customer::OrderItemsController < ApplicationController

  def create
     order_item = OrderItem.new(order_item_params)
     order_item.item = Item.find(item_params[:id])
  end

  private

  def order_item_params
  params.require(:order_item).permit(:item_id, :order_id, :price,:quantity)
  end

  def item_params
    params.require(:item).permit(:name, :image, :introduction,:price,:amount)
  end

end
