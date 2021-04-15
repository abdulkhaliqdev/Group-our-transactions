class Transaction < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :amount, presence: true
  validates :user_id, presence: true

  has_many :group, class_name: 'Group', foreign_key: 'group_id'

  scope :with_group, -> { includes(:user, :group) }
end
