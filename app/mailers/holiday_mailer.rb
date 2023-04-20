class HolidayMailer < ApplicationMailer
  default from: "trantorfoundation@cgil-fvg.net"

  def holiday_email
    @user = params[:user]
    @holiday = params[:holiday]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_holidays.png"] = File.read("app/assets/images/mail_logo_holidays.png")
    mail(
      from: "TrantorFoundation <trantorfoundation@cgil-fvg.net>",
      to: email_address_with_name(User.first.email, User.first.email),
      subject: "TrantorFoundation CGIL FVG  * Nuovo Inserimento FERIE *",
    )
  end

  def holiday_email_destroy
    @user = params[:user]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_holidays.png"] = File.read("app/assets/images/mail_logo_holidays.png")
    mail(
      from: "TrantorFoundation <trantorfoundation@cgil-fvg.net>",
      to: email_address_with_name(User.first.email, User.first.email),
      subject: "TrantorFoundation CGIL FVG  *** Eliminazione Inserimento FERIE ***",
    )
  end

  def holiday_email_update
    @user = params[:user]
    @holiday = params[:holiday]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_holidays.png"] = File.read("app/assets/images/mail_logo_holidays.png")
    mail(
      from: "TrantorFoundation <trantorfoundation@cgil-fvg.net>",
      to: email_address_with_name(User.first.email, User.first.email),
      subject: "TrantorFoundation CGIL FVG  ** Modifica Inserimento FERIE **",
    )
  end
end
