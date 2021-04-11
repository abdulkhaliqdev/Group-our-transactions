class User < ApplicationRecord
  has_many :groups
  validates :name, uniqueness: true, presence: true, length: { in: 4..30 }

  has_many :entities
end
