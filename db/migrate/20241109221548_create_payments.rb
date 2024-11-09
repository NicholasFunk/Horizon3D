class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.date :payment_date
      t.string :status

      t.timestamps
    end
  end
end
