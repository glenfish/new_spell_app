class Spell < ApplicationRecord
    validates :name, presence: true
    validates :category, presence: true
    validates :description, presence: true
end
