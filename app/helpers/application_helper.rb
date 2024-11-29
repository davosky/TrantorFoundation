module ApplicationHelper
  def full_user
    "#{current_user.first_name} #{current_user.last_name} #{current_user.office}"
  end

  def gender_avatar(user)
    if user.sex == "M"
      "user_avatar_male.svg"
    elsif user.sex == "F"
      "user_avatar_female.svg"
    else
      "user_avatar_neutral.svg"
    end
  end

  def god?
    current_user.god == true
  end

  def admin?
    current_user.admin == true
  end

  def manager?
    current_user.manager == true
  end

  def payer?
    current_user.god == true || current_user.admin == true || current_user.manager == true
  end
end
