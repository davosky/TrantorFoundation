class Veichle < ApplicationRecord
  belongs_to :user, optional: true

  validates :license_plate, uniqueness: true
  validates :license_plate, :name, :producer, :position, presence: true
end
