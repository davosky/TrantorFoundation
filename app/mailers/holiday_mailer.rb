class HolidayMailer < ApplicationMailer
  default from: "trantorfoundation@cgil-fvg.net"

  def holiday_email
    @user = params[:user]
    @holiday = params[:holiday]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_holidays.png"] = File.read("app/assets/images/mail_logo_holidays.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    @managers.each do |manager|
      mail(
        from: "TrantorFoundation <trantorfoundation@cgil-fvg.net>",
        to: manager.email,
        subject: "TrantorFoundation CGIL FVG  * Nuovo Inserimento FERIE *",
      )
    end
  end

  def holiday_email_destroy
    @user = params[:user]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_holidays.png"] = File.read("app/assets/images/mail_logo_holidays.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    @managers.each do |manager|
      mail(
        from: "TrantorFoundation <trantorfoundation@cgil-fvg.net>",
        to: manager.email,
        subject: "TrantorFoundation CGIL FVG  * Cancellazione FERIE *",
      )
    end
  end

  def holiday_email_update
    @user = params[:user]
    @holiday = params[:holiday]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_holidays.png"] = File.read("app/assets/images/mail_logo_holidays.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    @managers.each do |manager|
      mail(
        from: "TrantorFoundation <trantorfoundation@cgil-fvg.net>",
        to: manager.email,
        subject: "TrantorFoundation CGIL FVG  * Modifica FERIE *",
      )
    end
  end
end
