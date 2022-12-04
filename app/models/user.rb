class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable

  has_many :roads
  has_many :transports

  before_create :set_id

  def set_id
    last_id = User.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :first_name, :last_name, :category, :region, :province, :institute, :office, :validator, :validator_presentation, :sex, presence: true
end
