class Chat < ApplicationRecord
    belongs_to :product
    has_many :messages
end
