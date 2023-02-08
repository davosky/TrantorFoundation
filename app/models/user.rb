class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable

  has_many :roads
  has_many :transports
  has_many :places
  has_many :structures
  has_many :reasons
  has_many :veichles
  has_many :refunds
  has_many :refund_closures
  has_many :holidays
  has_many :hourly_holidays
  has_many :diseases

  mount_uploader :signature, SignatureUploader

  before_create :set_id

  def set_id
    last_id = User.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :first_name, :last_name, :category, :region, :province, :institute, :office, :validator, :validator_presentation, :sex, presence: true

  validates_integrity_of :signature

  validates_processing_of :signature

  def user_name_full
    "#{self.last_name} #{self.first_name}"
  end

  private

  def signature_size_validation
    errors[:signature] << "should be less than 1000KB" if signature.size > 1.0.megabytes
  end
end
