class Customer::ItemsController < ApplicationController

  def index
    @items = Item.all
    @customer = Customer.find(current_customer.id)
  end

  def show
   @item = Item.find(params[:id])
   @customer = Customer.find(current_customer.id)
  end


private

  def item_params
    params.require(:item).permit(:name, :image, :introduction,:price)
  end



end
