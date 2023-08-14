module ApplicationHelper
  def full_user
    "#{current_user.first_name} #{current_user.last_name} #{current_user.office}"
  end

  def user_avatar_gender(user)
    if user.sex == "M"
      "user_male.svg"
    elsif user.sex == "F"
      "user_female.svg"
    else
      "user_unknown.svg"
    end
  end

  def user_avatar(user)
    if user.avatar.url != nil
      user.avatar.url
    else
      if user.sex == "M"
        "user_male.svg"
      elsif user.sex == "F"
        "user_female.svg"
      else
        "user_unknown.svg"
      end
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
