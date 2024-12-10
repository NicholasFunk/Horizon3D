class Product < ApplicationRecord
    belongs_to :category
    validates :name, :price, :description, :category_id, presence: :true
    has_one_attached :image
    def self.ransackable_associations(auth_object = nil)
        [ "category" ]
    end


    def self.ransackable_attributes(auth_object = nil)
        [ "category_id", "created_at", "description", "id", "id_value", "name", "price", "stock_quantity", "updated_at", "image" ]
    end
end
