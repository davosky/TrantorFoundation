module ApplicationHelper
  def full_user
    "#{current_user.first_name} #{current_user.last_name} #{current_user.office}"
  end

  def god?
    current_user.god == true
  end

  def admin?
    current_user.admin == true
  end

  def payer?
    current_user.god == true || current_user.admin == true || current_user.manager == true
  end
end
