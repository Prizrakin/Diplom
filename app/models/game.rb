class Game < ApplicationRecord
    has_many :services
    validates:name, presence: true, uniqueness: true
end
