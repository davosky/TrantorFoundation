class UsersController < ApplicationController
  def january
    if current_user.god == true
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true)
      @user = results.first
    else
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true).where(province: current_user.province, region: current_user.region)
      @user = results.first
    end
    # Related Holidays
    # Filter records within the specified month
    currentyear = Date.today.year
    parsevar = "#{currentyear}-01-01"
    currentmonth = Date.parse(parsevar)
    month_start = currentmonth.beginning_of_month
    month_end = currentmonth.end_of_month
    @holidays = Holiday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @holidays = @holidays.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_holidays = HourlyHoliday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_holidays = @hourly_holidays.where(user_id: @user.id).order(start_time: :ASC)

    @permits = Permit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @permits = @permits.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_permits = HourlyPermit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_permits = @hourly_permits.where(user_id: @user.id).order(start_time: :ASC)

    @diseases = Disease.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @diseases = @diseases.where(user_id: @user.id).order(start_time: :ASC)
  end

  def february
    if current_user.god == true
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true)
      @user = results.first
    else
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true).where(province: current_user.province, region: current_user.region)
      @user = results.first
    end
    # Related Holidays
    # Filter records within the specified month
    currentyear = Date.today.year
    parsevar = "#{currentyear}-02-01"
    currentmonth = Date.parse(parsevar)
    month_start = currentmonth.beginning_of_month
    month_end = currentmonth.end_of_month
    @holidays = Holiday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @holidays = @holidays.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_holidays = HourlyHoliday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_holidays = @hourly_holidays.where(user_id: @user.id).order(start_time: :ASC)

    @permits = Permit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @permits = @permits.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_permits = HourlyPermit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_permits = @hourly_permits.where(user_id: @user.id).order(start_time: :ASC)

    @diseases = Disease.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @diseases = @diseases.where(user_id: @user.id).order(start_time: :ASC)
  end

  def march
    if current_user.god == true
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true)
      @user = results.first
    else
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true).where(province: current_user.province, region: current_user.region)
      @user = results.first
    end
    # Related Holidays
    # Filter records within the specified month
    currentyear = Date.today.year
    parsevar = "#{currentyear}-03-01"
    currentmonth = Date.parse(parsevar)
    month_start = currentmonth.beginning_of_month
    month_end = currentmonth.end_of_month
    @holidays = Holiday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @holidays = @holidays.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_holidays = HourlyHoliday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_holidays = @hourly_holidays.where(user_id: @user.id).order(start_time: :ASC)

    @permits = Permit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @permits = @permits.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_permits = HourlyPermit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_permits = @hourly_permits.where(user_id: @user.id).order(start_time: :ASC)

    @diseases = Disease.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @diseases = @diseases.where(user_id: @user.id).order(start_time: :ASC)
  end

  def april
    if current_user.god == true
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true)
      @user = results.first
    else
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true).where(province: current_user.province, region: current_user.region)
      @user = results.first
    end
    # Related Holidays
    # Filter records within the specified month
    currentyear = Date.today.year
    parsevar = "#{currentyear}-04-01"
    currentmonth = Date.parse(parsevar)
    month_start = currentmonth.beginning_of_month
    month_end = currentmonth.end_of_month
    @holidays = Holiday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @holidays = @holidays.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_holidays = HourlyHoliday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_holidays = @hourly_holidays.where(user_id: @user.id).order(start_time: :ASC)

    @permits = Permit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @permits = @permits.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_permits = HourlyPermit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_permits = @hourly_permits.where(user_id: @user.id).order(start_time: :ASC)

    @diseases = Disease.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @diseases = @diseases.where(user_id: @user.id).order(start_time: :ASC)
  end

  def may
    if current_user.god == true
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true)
      @user = results.first
    else
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true).where(province: current_user.province, region: current_user.region)
      @user = results.first
    end
    # Related Holidays
    # Filter records within the specified month
    currentyear = Date.today.year
    parsevar = "#{currentyear}-05-01"
    currentmonth = Date.parse(parsevar)
    month_start = currentmonth.beginning_of_month
    month_end = currentmonth.end_of_month
    @holidays = Holiday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @holidays = @holidays.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_holidays = HourlyHoliday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_holidays = @hourly_holidays.where(user_id: @user.id).order(start_time: :ASC)

    @permits = Permit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @permits = @permits.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_permits = HourlyPermit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_permits = @hourly_permits.where(user_id: @user.id).order(start_time: :ASC)

    @diseases = Disease.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @diseases = @diseases.where(user_id: @user.id).order(start_time: :ASC)
  end

  def june
    if current_user.god == true
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true)
      @user = results.first
    else
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true).where(province: current_user.province, region: current_user.region)
      @user = results.first
    end
    # Related Holidays
    # Filter records within the specified month
    currentyear = Date.today.year
    parsevar = "#{currentyear}-06-01"
    currentmonth = Date.parse(parsevar)
    month_start = currentmonth.beginning_of_month
    month_end = currentmonth.end_of_month
    @holidays = Holiday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @holidays = @holidays.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_holidays = HourlyHoliday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_holidays = @hourly_holidays.where(user_id: @user.id).order(start_time: :ASC)

    @permits = Permit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @permits = @permits.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_permits = HourlyPermit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_permits = @hourly_permits.where(user_id: @user.id).order(start_time: :ASC)

    @diseases = Disease.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @diseases = @diseases.where(user_id: @user.id).order(start_time: :ASC)
  end

  def july
    if current_user.god == true
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true)
      @user = results.first
    else
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true).where(province: current_user.province, region: current_user.region)
      @user = results.first
    end
    # Related Holidays
    # Filter records within the specified month
    currentyear = Date.today.year
    parsevar = "#{currentyear}-07-01"
    currentmonth = Date.parse(parsevar)
    month_start = currentmonth.beginning_of_month
    month_end = currentmonth.end_of_month
    @holidays = Holiday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @holidays = @holidays.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_holidays = HourlyHoliday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_holidays = @hourly_holidays.where(user_id: @user.id).order(start_time: :ASC)

    @permits = Permit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @permits = @permits.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_permits = HourlyPermit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_permits = @hourly_permits.where(user_id: @user.id).order(start_time: :ASC)

    @diseases = Disease.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @diseases = @diseases.where(user_id: @user.id).order(start_time: :ASC)
  end

  def august
    if current_user.god == true
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true)
      @user = results.first
    else
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true).where(province: current_user.province, region: current_user.region)
      @user = results.first
    end
    # Related Holidays
    # Filter records within the specified month
    currentyear = Date.today.year
    parsevar = "#{currentyear}-08-01"
    currentmonth = Date.parse(parsevar)
    month_start = currentmonth.beginning_of_month
    month_end = currentmonth.end_of_month
    @holidays = Holiday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @holidays = @holidays.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_holidays = HourlyHoliday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_holidays = @hourly_holidays.where(user_id: @user.id).order(start_time: :ASC)

    @permits = Permit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @permits = @permits.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_permits = HourlyPermit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_permits = @hourly_permits.where(user_id: @user.id).order(start_time: :ASC)

    @diseases = Disease.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @diseases = @diseases.where(user_id: @user.id).order(start_time: :ASC)
  end

  def september
    if current_user.god == true
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true)
      @user = results.first
    else
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true).where(province: current_user.province, region: current_user.region)
      @user = results.first
    end
    # Related Holidays
    # Filter records within the specified month
    currentyear = Date.today.year
    parsevar = "#{currentyear}-09-01"
    currentmonth = Date.parse(parsevar)
    month_start = currentmonth.beginning_of_month
    month_end = currentmonth.end_of_month
    @holidays = Holiday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @holidays = @holidays.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_holidays = HourlyHoliday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_holidays = @hourly_holidays.where(user_id: @user.id).order(start_time: :ASC)

    @permits = Permit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @permits = @permits.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_permits = HourlyPermit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_permits = @hourly_permits.where(user_id: @user.id).order(start_time: :ASC)

    @diseases = Disease.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @diseases = @diseases.where(user_id: @user.id).order(start_time: :ASC)
  end

  def october
    if current_user.god == true
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true)
      @user = results.first
    else
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true).where(province: current_user.province, region: current_user.region)
      @user = results.first
    end
    # Related Holidays
    # Filter records within the specified month
    currentyear = Date.today.year
    parsevar = "#{currentyear}-10-01"
    currentmonth = Date.parse(parsevar)
    month_start = currentmonth.beginning_of_month
    month_end = currentmonth.end_of_month
    @holidays = Holiday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @holidays = @holidays.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_holidays = HourlyHoliday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_holidays = @hourly_holidays.where(user_id: @user.id).order(start_time: :ASC)

    @permits = Permit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @permits = @permits.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_permits = HourlyPermit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_permits = @hourly_permits.where(user_id: @user.id).order(start_time: :ASC)

    @diseases = Disease.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @diseases = @diseases.where(user_id: @user.id).order(start_time: :ASC)
  end

  def november
    if current_user.god == true
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true)
      @user = results.first
    else
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true).where(province: current_user.province, region: current_user.region)
      @user = results.first
    end
    # Related Holidays
    # Filter records within the specified month
    currentyear = Date.today.year
    parsevar = "#{currentyear}-11-01"
    currentmonth = Date.parse(parsevar)
    month_start = currentmonth.beginning_of_month
    month_end = currentmonth.end_of_month
    @holidays = Holiday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @holidays = @holidays.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_holidays = HourlyHoliday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_holidays = @hourly_holidays.where(user_id: @user.id).order(start_time: :ASC)

    @permits = Permit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @permits = @permits.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_permits = HourlyPermit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_permits = @hourly_permits.where(user_id: @user.id).order(start_time: :ASC)

    @diseases = Disease.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @diseases = @diseases.where(user_id: @user.id).order(start_time: :ASC)
  end

  def december
    if current_user.god == true
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true)
      @user = results.first
    else
      @q = User.ransack(params[:q])
      results = @q.result(distinct: true).where(province: current_user.province, region: current_user.region)
      @user = results.first
    end
    # Related Holidays
    # Filter records within the specified month
    currentyear = Date.today.year
    parsevar = "#{currentyear}-12-01"
    currentmonth = Date.parse(parsevar)
    month_start = currentmonth.beginning_of_month
    month_end = currentmonth.end_of_month
    @holidays = Holiday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @holidays = @holidays.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_holidays = HourlyHoliday.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_holidays = @hourly_holidays.where(user_id: @user.id).order(start_time: :ASC)

    @permits = Permit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @permits = @permits.where(user_id: @user.id).order(start_time: :ASC)

    @hourly_permits = HourlyPermit.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @hourly_permits = @hourly_permits.where(user_id: @user.id).order(start_time: :ASC)

    @diseases = Disease.where(
      "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
      month_start: month_start,
      month_end: month_end,
    )
    @diseases = @diseases.where(user_id: @user.id).order(start_time: :ASC)
  end
end
