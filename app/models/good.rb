class Good < ApplicationRecord
  self.inheritance_column = nil

  validates :consignment_id, :name, :type, presence: true
end