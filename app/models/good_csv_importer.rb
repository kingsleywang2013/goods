require 'csv'

class GoodCsvImporter
  attr_reader :errors

  def initialize
    @errors = []
  end

  def import(file)
    return @errors << 'You must need to upload csv file first.' if file.nil?

    check_file_type(file)

    CSV.foreach(file.path, headers: true) do |row|
      next unless validate_fields(row).empty?
      Good.create!(row.to_hash)
    end
  end

  private

  def check_file_type file
    @errors << 'Upload file should be CSV only.' if file.path.split('.').last.to_s.downcase != 'csv'
  end

  def validate_fields row
    if row['consignment_id'].blank?
      @errors << 'Consignment ID could not be blank'
    elsif row['type'].blank?
      @errors << 'Type could not be blank'
    elsif row['name'].blank?
      @errors << 'Name could not be blank'
    elsif !Good.find_by(name: row['name']).nil?
      @errors << 'Name should be unique'
    end
    @errors
  end
end
