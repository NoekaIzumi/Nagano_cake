class CreateOders < ActiveRecord::Migration[6.1]
  def change
    create_table :oders do |t|

      t.references :customer_id , foreign_key: true, null: false
      t.string :name, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.integer :total_amount, null: false
      t.integer :shipping_fee, null: false
      t.integer :payment_method, null: false
      
      t.timestamps
    end
  end
end
