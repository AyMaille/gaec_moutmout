class Lot < ApplicationRecord
  belongs_to :field

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      lot_hash = Country.new
      lot_hash.name = row[0]
      lot_hash.code = row[1]
      lot_hash.save
    end
  end
end
