class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true, length: { in: 4..30 }

  has_many :entities
end
