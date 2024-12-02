class ProductsPriceChangeDatatype < ActiveRecord::Migration[7.2]
  def change
    change_column(:Products, :price, :integer)
  end
end
