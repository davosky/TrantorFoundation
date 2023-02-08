# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # ==================================================================
    # *** God ***
    # ==================================================================
    # God can do everything
    can :manage, :all if user.god == true
    # ==================================================================
    # *** God ***
    # ==================================================================

    # ==================================================================
    # *** Manager ***
    # ==================================================================
    if user.manager == true || user.admin == true
      # Can manage all owned records on Refund model
      can :create, Refund
      can :update, Refund do |refund|
        refund.user == user
      end
      can :destroy, Refund do |refund|
        refund.user == user
      end
      can :read, Refund do |refund|
        refund.user == user
      end
      can :print, Refund do |refund|
        refund.user == user
      end
      can :print_list, Refund do |refund|
        refund.user == user
      end
      # Can manage all owned records on RefundClosure model
      can :create, RefundClosure
      can :update, RefundClosure do |refund_closure|
        refund_closure.user.province == user.province && refund_closure.user.region == user.region
      end
      can :destroy, RefundClosure do |refund_closure|
        refund_closure.user == user if refund_closure.payed != true
      end
      can :read, RefundClosure do |refund_closure|
        refund_closure.user.province == user.province && refund_closure.user.region == user.region
      end

      can :search, RefundClosure do |refund_closure|
        refund_closure.user.province == user.province && refund_closure.user.region == user.region
      end
      # Can manage all owned records on Holiday model
      can :create, Holiday
      can :update, Holiday do |holiday|
        holiday.user.province == user.province && holiday.user.region == user.region
      end
      can :destroy, Holiday do |holiday|
        holiday.user.province == user.province && holiday.user.region == user.region
      end
      can :read, Holiday do |holiday|
        holiday.user.province == user.province && holiday.user.region == user.region
      end
      # Can manage all owned records on HourlyHoliday model
      can :create, HourlyHoliday
      can :update, HourlyHoliday do |hourly_holiday|
        hourly_holiday.user.province == user.province && hourly_holiday.user.region == user.region
      end
      can :destroy, HourlyHoliday do |hourly_holiday|
        hourly_holiday.user.province == user.province && hourly_holiday.user.region == user.region
      end
      can :read, HourlyHoliday do |hourly_holiday|
        hourly_holiday.user.province == user.province && hourly_holiday.user.region == user.region
      end
      # Can manage all owned records on Disease model
      can :create, Disease
      can :update, Disease do |disease|
        disease.user.province == user.province && disease.user.region == user.region
      end
      can :destroy, Disease do |disease|
        disease.user.province == user.province && disease.user.region == user.region
      end
      can :read, Disease do |disease|
        disease.user.province == user.province && disease.user.region == user.region
      end
      # Can manage all owned records on Place model
      can :manage, Place do |place|
        place.user == user
      end
      # Can manage all owned records on Reason model
      can :manage, Reason do |reason|
        reason.user == user
      end
      # Can manage all owned records on Road model
      can :manage, Road do |road|
        road.user == user
      end
      # Can manage all owned records on Structure model
      can :manage, Structure do |structure|
        structure.user == user
      end
      # Can manage all owned records on Transport model
      can :manage, Transport do |transport|
        transport.user == user
      end
      # Can manage all owned records on Veichle model
      can :manage, Veichle do |veichle|
        veichle.user == user
      end
    end
    # ==================================================================
    # *** Manager ***
    # ==================================================================

    # ==================================================================
    # *** Regular User ***
    # ==================================================================
    if user.regular == true
      # Can manage all owned records on Refund model
      can :read, Refund do |refund|
        refund.user == user
      end
      can :create, Refund
      can :update, Refund do |refund|
        refund.user == user
      end
      can :destroy, Refund do |refund|
        refund.user == user
      end
      can :read, Refund do |refund|
        refund.user == user
      end
      can :print, Refund do |refund|
        refund.user == user
      end
      can :print_list, Refund do |refund|
        refund.user == user
      end
      # Can manage all owned records on RefundClosure model
      can :read, RefundClosure do |refund_closure|
        refund_closure.user == user
      end
      can :create, RefundClosure
      can :update, RefundClosure do |refund_closure|
        refund_closure.user == user
      end
      can :destroy, RefundClosure do |refund_closure|
        refund_closure.user == user && refund_closure.payed != true
      end
      can :read, RefundClosure do |refund_closure|
        refund_closure.user == user
      end
      # Can manage all owned records on Holiday model
      can :read, Holiday do |holiday|
        holiday.user == user
      end
      can :create, Holiday
      can :update, Holiday do |holiday|
        holiday.user == user && holiday.processed != true
      end
      can :destroy, Holiday do |holiday|
        holiday.user == user && holiday.processed != true
      end
      can :read, Holiday do |holiday|
        holiday.user == user
      end
      # Can manage all owned records on HourlyHoliday model
      can :read, HourlyHoliday do |hourly_holiday|
        hourly_holiday.user == user
      end
      can :create, HourlyHoliday
      can :update, HourlyHoliday do |hourly_holiday|
        hourly_holiday.user == user && hourly_holiday.processed != true
      end
      can :destroy, HourlyHoliday do |hourly_holiday|
        hourly_holiday.user == user && hourly_holiday.processed != true
      end
      # Can manage all owned records on Disease model
      can :read, Disease do |disease|
        disease.user == user
      end
      can :create, Disease
      can :update, Disease do |disease|
        disease.user == user && disease.processed != true
      end
      can :destroy, Disease do |disease|
        disease.user == user && disease.processed != true
      end
      can :read, Disease do |disease|
        disease.user == user
      end
      # Can manage all owned records on Place model
      can :manage, Place do |place|
        place.user == user
      end
      # Can manage all owned records on Reason model
      can :manage, Reason do |reason|
        reason.user == user
      end
      # Can manage all owned records on Road model
      can :manage, Road do |road|
        road.user == user
      end
      # Can manage all owned records on Structure model
      can :manage, Structure do |structure|
        structure.user == user
      end
      # Can manage all owned records on Transport model
      can :manage, Transport do |transport|
        transport.user == user
      end
      # Can manage all owned records on Veichle model
      can :manage, Veichle do |veichle|
        veichle.user == user
      end
    end
    # ==================================================================
    # *** Regular User ***
    # ==================================================================
  end
end
