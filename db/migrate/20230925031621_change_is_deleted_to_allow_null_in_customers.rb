class ChangeIsDeletedToAllowNullInCustomers < ActiveRecord::Migration[6.1]
  def change
    change_column :customers, :is_deleted, :boolean, null: true
  end
end