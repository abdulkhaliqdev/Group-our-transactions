class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true, uniqueness: true, length: { in: 4..30 }
  validates :amount, presence: true, numericality: true
end
