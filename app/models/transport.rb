class Transport < ApplicationRecord
  belongs_to :user, optional: true

  before_create :set_transport_id

  def set_transport_id
    last_id = Transport.maximum(:id)
    self.id = last_id.to_i + 1
  end

  before_update :check_transport
  before_destroy :check_transport

  def check_transport
    if self.name == "Veicolo Aziendale" || self.name == "Veicolo Privato" || self.id == 1 || self.id == 2
      redirect_to transport_path
    end
  end

  validates :name, :position, presence: true
end
