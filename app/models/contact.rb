class Contact < ApplicationRecord
    validates :phone, :email, presence: true

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "email", "id", "phone", "updated_at"]
    end
end
