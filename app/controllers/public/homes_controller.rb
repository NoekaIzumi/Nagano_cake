class Public::HomesController < ApplicationController

  def top
     @items = Item.page(params[:page]).per(4).order(created_at: :desc)
  end

  def about
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction,:price,:amount)
  end

end
