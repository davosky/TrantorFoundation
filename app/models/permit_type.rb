class PermitType < ApplicationRecord
  has_many :permits
  has_many :hourly_permits

  validates :name, presence: true
end
