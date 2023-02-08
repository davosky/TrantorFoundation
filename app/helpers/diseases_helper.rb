module DiseasesHelper
  def disease_full_user(disease)
    "#{disease.user.first_name} #{disease.user.last_name}"
  end
end
