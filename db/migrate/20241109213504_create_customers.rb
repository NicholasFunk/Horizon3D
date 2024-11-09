class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :customers do |t|
      t.string :fullname
      t.string :email
      t.string :address
      t.integer :phone

      t.timestamps
    end
  end
end
