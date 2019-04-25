class Good < ApplicationRecord
  self.inheritance_column = nil

  scope :filter_by_type, ->(type) { where('type LIKE ?', "%#{type}%") }
  scope :filter_by_entry_at, ->(entry) { where(entry_at: entry.to_date.beginning_of_day..entry.to_date.end_of_day) }
  scope :mix_filter, ->(type, entry) { where('type LIKE ?', "%#{type}%").where(entry_at: entry.to_date.beginning_of_day..entry.to_date.end_of_day) }


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
