class User < ApplicationRecord
  has_many :groups
  validates :name, uniqueness: true, presence: true

  has_many :transactions
end
