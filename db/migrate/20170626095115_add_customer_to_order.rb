class AddCustomerToOrder < ActiveRecord::Migration
  def up
    add_column(:orders, 'customer_id', :integer)
    add_index(:orders, :customer_id)
  end

  def down
    remove_column(:orders, 'customer_id')
  end
end
