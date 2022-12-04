class Place < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, :position, presence: true
end
