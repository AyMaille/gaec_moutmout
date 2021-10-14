class Sheep < ApplicationRecord
  belongs_to :field
  validates :genre, acceptance: { accept: ["male", "female"] }
  validates :expected_lambs, numericality: { only_integer: true }
  validates :kind, acceptance: { accept: ["ram", "sheep", "lamb"] }
  validates :status, acceptance: { accept: ["alive", "ill", "sold", "dead"] }

  def translated_status
    case self.status
    when "alive"
      ""
    when "ill"
      "malade"
    when "sold"
      "vendu"
    when "dead"
      "mort"
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      if sheep.find_by(name: row[0]).nil?
        sheep = sheep.new()
      sheep = sheep.find_by(name: row[0])
      sheep.weight = row[15]
      sheep.update
    end
  end
end
