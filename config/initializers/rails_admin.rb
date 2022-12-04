RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.god == true
  end

  config.main_app_name = ["Trantor Foundation"]

  config.model "User" do
    visible true
    label "Utente"
    label_plural "Utenti"
  end

  config.model "Road" do
    visible true
    label "Percorso"
    label_plural "Percorsi"
  end

  config.model "Transport" do
    visible true
    label "Trasporto"
    label_plural "Trasporti"
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
