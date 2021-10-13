class Sheep < ApplicationRecord
  belongs_to :field
  validates :genre, acceptance: { accept: ["male", "female"] }
  validates :expected_lambs, numericality: { only_integer: true }
  validates :kind, acceptance: { accept: ["ram", "sheep", "lamb"] }
  validates :status, acceptance: { accept: ["alive", "ill", "sold", "dead"] }

  def translated_status
    case self.status
    when "alive"
      "vivant"
    when "ill"
      "malade"
    when "sold"
      "vendu"
    when "dead"
      "mort"
    end
  end
end
