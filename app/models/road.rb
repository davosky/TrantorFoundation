class Road < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, :road_lenght, :position, presence: true
end
