class CreatePaymentMethods < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_methods do |t|
      t.references :order, null: false, foreign_key: true
      t.string :method
      t.text :details

      t.timestamps
    end
  end
end
