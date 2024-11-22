module RefundsHelper
  def used_veichle(refund)
    if refund.veichle_id != nil
      ("Ho usato il seguente veicolo: <strong>#{refund.veichle_fr}</strong>.").html_safe
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
      ("<tr><td>Parcheggio:</td><td>#{number_to_currency(refund.parking_cost)}</td></tr>").html_safe
    end
  end

  def incurred_food_cost(refund)
    if refund.food_cost != nil && refund.food_cost > 0.00
      ("<tr><td>Vitto:</td><td>#{number_to_currency(refund.food_cost)}</td></tr>").html_safe
    end
  end

  def incurred_room_cost(refund)
    if refund.room_cost != nil && refund.room_cost > 0.00
      ("<tr><td>Alloggioi:</td><td>#{number_to_currency(refund.room_cost)}</td></tr>").html_safe
    end
  end

  def incurred_ticket_cost(refund)
    if refund.ticket_cost != nil && refund.ticket_cost > 0.00
      ("<tr><td>Ticket:</td><td>#{number_to_currency(refund.ticket_cost)}</td></tr>").html_safe
    end
  end

  def incurred_generic_cost(refund)
    if refund.generic_cost != nil && refund.generic_cost > 0.00
      ("<tr><td>Varie:</td><td>#{number_to_currency(refund.generic_cost)}</td></tr>").html_safe
    end
  end

  def incurred_highway_cost(refund)
    if refund.highway_cost_fr != nil && refund.highway_cost_fr > 0.00
      ("<tr><td>Autostrada:</td><td>#{number_to_currency(refund.highway_cost_fr)}</td></tr>").html_safe
    end
  end

  def incurred_private_veichle_cost(refund)
    if refund.transport.name == "Veicolo Privato"
      ("<tr><td>Costo Totale Percorso:</td><td>#{number_to_currency(refund.veichle.cost_per_km * refund.road_lenght_fr)}</td><td class='text-secondary'>#{number_to_currency(refund.veichle.cost_per_km)} x #{refund.road_lenght_fr}&nbsp;Km</td></tr>").html_safe
    end
  end

  def conditional_syle_prefilled_forms(refund)
    if refund.reason_id != nil ||
       refund.road_id != nil ||
       refund.place_id != nil ||
       refund.structure_id != nil
      "display:block"
    else
      "display:none"
    end
  end

  def conditional_syle_free_forms(refund)
    if refund.reason_id != nil ||
       refund.road_id != nil ||
       refund.place_id != nil ||
       refund.structure_id != nil
      "display:none"
    elsif refund.reason_fr != nil ||
          refund.road_fr != nil ||
          refund.place_fr != nil ||
          refund.structure_fr != nil
      "display:block"
    else
      "display:none"
    end
  end
end
