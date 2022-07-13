class Product < ApplicationRecord
  belongs_to :service
  has_many :reviews
  has_many :transactions
  has_many :chats
  validates :long_description, presence: true
  validates :short_description, presence: true
  validates :price, presence: true
  validates :salesman, presence: true
end
