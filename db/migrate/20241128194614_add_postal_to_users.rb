class AddPostalToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :zipcode, :text
  end
end
