class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  has_many :transactions, class_name: 'Transaction', foreign_key: 'transaction_id'

end
