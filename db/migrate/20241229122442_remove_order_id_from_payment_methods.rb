class RemoveOrderIdFromPaymentMethods < ActiveRecord::Migration[7.1]
  def change
    remove_column :payment_methods, :order_id, :integer
  end
end
