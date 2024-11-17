class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
