class Good < ApplicationRecord
  self.inheritance_column = nil

  validates :consignment_id, :name, :type, presence: true
  validates :name, uniqueness: true

  before_save :check_consignment_id

  private

  def check_consignment_id
    if Good.find_by(consignment_id: self.consignment_id).nil?
      self.entry_at = DateTime.now
    else
      self.exit_at = DateTime.now
    end
  end
end
