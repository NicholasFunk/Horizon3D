class CreateCartProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :cart_products do |t|
      t.timestamps
    end
  end
end
