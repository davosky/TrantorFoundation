module RefundsHelper
  def used_veichle(refund)
    if refund.veichle_id != nil
      ("Ho usato il seguente veicolo: <strong>#{refund.veichle.producer} #{refund.veichle.name}</strong> con targa <strong>#{refund.veichle.license_plate}</strong>.").html_safe
    end
  end

  def departure_gender(refund)
    if refund.user.sex == "M"
      "Sono partito il giorno "
    elsif refund.user.sex == "F"
      "Sono partita il giorno "
    else
      "Sono partit* il giorno "
    end
  end

  def return_gender(refund)
    if refund.user.sex == "M"
      "Sono rientrato in sede il giorno "
    elsif refund.user.sex == "F"
      "Sono rientrata il giorno "
    else
      "Sono rientrat* il giorno "
    end
  end

  def incurred_prking_cost(refund)
    if refund.parking_cost != nil && refund.parking_cost > 0.00
      ("<li>Parcheggio: #{number_to_currency(refund.parking_cost)}</li>").html_safe
    end
  end

  def incurred_food_cost(refund)
    if refund.food_cost != nil
      ("<li>Vitto: #{number_to_currency(refund.food_cost)}</li>").html_safe
    end
  end

  def incurred_room_cost(refund)
    if refund.room_cost != nil && refund.room_cost > 0.00
      ("<li>Alloggio: #{number_to_currency(refund.room_cost)}</li>").html_safe
    end
  end

  def incurred_ticket_cost(refund)
    if refund.ticket_cost != nil && refund.ticket_cost > 0.00
      ("<li>Ticket: #{number_to_currency(refund.ticket_cost)}</li>").html_safe
    end
  end

  def incurred_generic_cost(refund)
    if refund.generic_cost != nil && refund.generic_cost > 0.00
      ("<li>Varie: #{number_to_currency(refund.generic_cost)}</li>").html_safe
    end
  end

  def incurred_highway_cost(refund)
    if refund.road.highway_cost != nil && refund.road.highway_cost > 0.00
      ("<li>Costo Autostrada: #{number_to_currency(refund.road.highway_cost)}</li>").html_safe
    end
  end

  def incurred_private_veichle_cost(refund)
    if refund.transport.name == "Veicolo Privato"
      total_lenght_cost = refund.user.cost_per_km * refund.road.road_lenght
      ("<li>Tabella ACI: <strong>#{number_to_currency(refund.user.cost_per_km)}</strong> al chilometro moltiplicato per <strong>#{refund.road.road_lenght} km</strong> di percorso per un totale di <strong>#{number_to_currency(total_lenght_cost)}</strong></li>").html_safe
    end
  end
end
