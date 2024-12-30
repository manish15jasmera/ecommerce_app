class AddPaymentMethodIdToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :payment_method_id, :integer
    add_index :orders, :payment_method_id
  end
end
