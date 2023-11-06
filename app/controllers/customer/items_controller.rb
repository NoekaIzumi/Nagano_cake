class Customer::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8).order(created_at: :desc)
    @total_count = Item.count
    if customer_signed_in?
       @customer = Customer.find(current_customer.id)
    end

  end

  def show
   @item = Item.find(params[:id])
   if customer_signed_in?
   @customer = Customer.find(current_customer.id)
   @cart_item = CartItem.new
   end

  end


private

  def item_params
    params.require(:item).permit(:name, :image, :introduction,:price,:amount)
  end



end
