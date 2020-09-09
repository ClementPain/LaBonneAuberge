class Village < ApplicationRecord
    validates :email, presence: true, uniqueness: true, length: { in: 6..50 }
    validates :name, presence: true, uniqueness: true, length: { in: 2..40 }
    validates :zipcode, presence: true, length: {is: 5 }
end
