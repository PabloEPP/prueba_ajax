class Company < ApplicationRecord
    has_many :claims, dependent: :destroy
end
