class About < ApplicationRecord
    validates :description, presence: true

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "updated_at"]
    end
end
