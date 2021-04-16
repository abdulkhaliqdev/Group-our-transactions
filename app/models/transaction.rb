class Transaction < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :amount, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: false
  has_many :group, class_name: 'Group', foreign_key: 'group_id'

  scope :with_group, ->(user_id) { where('group_id > 0 and user_id=?', user_id) }
end
