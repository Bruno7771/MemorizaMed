class Medication < ApplicationRecord
  belongs_to :user

  validates :name, :dosage, :frequency,  presence: true
end
