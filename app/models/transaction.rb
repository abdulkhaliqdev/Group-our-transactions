class Transaction < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :amount, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: false
  has_many :group, through: :manifests

  scope :with_group, ->(id) { where('group_id > 0 and user_id=?', id) }
  scope :without_group, ->(id) { where('group_id = nil and user_id=?', id) }
  scope :all_transactoins, ->(id) { where('user_id=?', id) }
  scope :check_group, -> { where('group_id =? ', group_id) }
  scope :without_user, ->(user_id) { where.not('user_id=?', user_id) }
end
