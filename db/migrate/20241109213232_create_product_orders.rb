class CreateProductOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :product_orders do |t|
      t.integer :quantity
      t.decimal :price
      t.decimal :subtotal

      t.timestamps
    end
  end
end
