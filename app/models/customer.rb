class Customer < ApplicationRecord
    validates :fullname, :address, :phone
end
