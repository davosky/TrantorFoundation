class Refund < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :place, optional: true
  belongs_to :reason, optional: true
  belongs_to :veichle, optional: true
  belongs_to :road, optional: true
  belongs_to :structure, optional: true
  belongs_to :transport, optional: true

  before_create :set_refund_number

  def set_refund_number
    last_refund_number = Refund.maximum(:refund_number)
    self.refund_number = last_refund_number.to_i + 1
  end

  before_save :fill_free_fields, :calculate_total

  # It fill free fields(_fr) from associations
  def fill_free_fields
    if self.user_id != nil
      self.user_fr = "#{self.user.first_name} #{self.user.last_name}"
    end

    if self.reason_id != nil
      self.reason_fr = self.reason.name
    end

    if self.road_id != nil
      self.road_fr = self.road.name
      if self.road.highway_cost != nil
        self.highway_cost_fr = self.road.highway_cost
      end
      if self.road.road_lenght != nil
        self.road_lenght_fr = self.road.road_lenght
      end
    else
    end

    if self.place_id != nil
      self.place_fr = self.place.name
    end

    if self.structure_id != nil
      self.structure_fr = self.structure.name
    end

    if self.transport_id != nil
      self.transport_fr = self.transport.name
    end

    if self.veichle_id != nil
      self.veichle_fr = "#{self.veichle.producer} #{self.veichle.name} con targa: #{self.veichle.license_plate}"
    end
  end

  # It sum the expences fields to create total_amount
  def calculate_total
    if self.food_cost != nil
      food = self.food_cost
    else
      food = 0.00
    end

    if self.parking_cost != nil
      parking = self.parking_cost
    else
      parking = 0.00
    end

    if self.room_cost != nil
      room = self.room_cost
    else
      room = 0.00
    end

    if self.ticket_cost != nil
      ticket = self.ticket_cost
    else
      ticket = 0.00
    end

    if self.generic_cost != nil
      generic = self.generic_cost
    else
      generic = 0.00
    end

    if self.road_id != nil && self.road.highway_cost != nil
      highway = self.road.highway_cost
      self.highway_cost_fr = self.road.highway_cost
    elsif self.highway_cost_fr != nil
      highway = self.highway_cost_fr
    else
      highway = 0.00
    end

    # Check if it is a veichle and what type of
    if self.transport.name == "Veicolo Aziendale" # company veichle
      sum_value = food + parking + room + ticket + generic + highway
    elsif self.transport.name == "Veicolo Privato" # private veichle
      if self.road_id != nil
        partial_cost = self.road.road_lenght * self.user.cost_per_km
      else
        partial_cost = self.road_lenght_fr * self.user.cost_per_km
      end
      sum_value = food + parking + room + ticket + generic + highway + partial_cost
    else
      sum_value = food + parking + room + ticket + generic
    end

    self.total_amount = sum_value
  end

  # Validations
  validates :departure_date, :return_date, :request_date, :refund_date, :transport_id, presence: true
end
