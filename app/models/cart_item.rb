class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  belongs_to :order

  # 小計を求めるメソッド
  def subtotal
   item.with_tax_price * amount
  end
end
