class Service < ApplicationRecord
  belongs_to :game
  has_many :products
  validates :name, presence: true
end
