class Manifest < ApplicationRecord
  belongs_to :group
  belongs_to :transaction
end
