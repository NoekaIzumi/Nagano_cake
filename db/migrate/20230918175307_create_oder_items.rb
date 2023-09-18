class CreateOderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :oder_items do |t|

      t.references :item_id, foreign_key: true, null: false
      t.references :oder_id, foreign_key: true, null: false
      t.integer :price, null: false
      t.integer :quantitiy, null: false
      
      t.timestamps
    end
  end
end
