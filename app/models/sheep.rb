class Sheep < ApplicationRecord
  belongs_to :field
  validates :genre, acceptance: { accept: ["male", "female"] }
  validates :expected_lambs, numericality: { only_integer: true }
  validates :kind, acceptance: { accept: ["ram", "sheep", "lamb"] }
  validates :status, acceptance: { accept: ["alive", "ill", "sold", "dead"] }

  after_initialize :default_values

  def translated_status
    case self.status
    when "alive"
      "RAS"
    when "ill"
      "malade"
    when "sold"
      "vendu"
    when "dead"
      "mort"
    end
  end

  def self.import(file, field)
    CSV.foreach(file.path, headers: true) do |row|
      if Sheep.find_by(electronic_id: row[0]).nil?
        sheep = Sheep.new(electronic_id: row[0], weight: row[15], field_id: field.id, expected_lambs: 0)
        sheep.save!
      else
        sheep = Sheep.find_by(electronic_id: row[0])
        sheep.update!(weight: row[15])
      end
    end
  end

  private

  def default_values
    self.kind ||= "lamb"
    self.pregnant ||= false
    self.expected_lambs ||= 0
    self.status ||= "alive"
    self.age ||= 0
  end
end
