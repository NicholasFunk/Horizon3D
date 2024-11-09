class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :email
      t.string :address
      t.integer :phone

      t.timestamps
    end
  end
end
