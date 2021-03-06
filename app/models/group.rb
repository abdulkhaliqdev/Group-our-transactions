class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :Icon, presence: true
  has_many :transactions, through: :manifests

  scope :find_group, ->(id) { where('id=?', id) }
end
