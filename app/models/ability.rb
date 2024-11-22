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
        refund.user_id == user.id
      end
      can :destroy, Refund do |refund|
        refund.user_id == user.id
      end
      can :read, Refund do |refund|
        refund.user_id == user.id
      end
      can :print, Refund do |refund|
        refund.user_id == user.id
      end
      can :print_list, Refund do |refund|
        refund.user_id == user.id
      end
      # Can manage all owned records on RefundClosure model
      can :create, RefundClosure
      can :update, RefundClosure do |refund_closure|
        refund_closure.user.province == user.province && refund_closure.user.region == user.region
      end
      can :destroy, RefundClosure do |refund_closure|
        refund_closure.user_id == user.id if refund_closure.payed != true
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
      can :search, Holiday do |holiday|
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
      can :search, HourlyHoliday do |hourly_holiday|
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
      can :search, Disease do |disease|
        disease.user.province == user.province && disease.user.region == user.region
      end
      # Can manage all owned records on Permit model
      can :create, Permit
      can :update, Permit do |permit|
        permit.user.province == user.province && permit.user.region == user.region
      end
      can :destroy, Permit do |permit|
        permit.user.province == user.province && permit.user.region == user.region
      end
      can :read, Permit do |permit|
        permit.user.province == user.province && permit.user.region == user.region
      end
      can :search, Permit do |permit|
        permit.user.province == user.province && permit.user.region == user.region
      end
      # Can manage all owned records on HourlyPermit model
      can :create, HourlyPermit
      can :update, HourlyPermit do |fourly_permit|
        fourly_permit.user.province == user.province && fourly_permit.user.region == user.region
      end
      can :destroy, HourlyPermit do |fourly_permit|
        fourly_permit.user.province == user.province && fourly_permit.user.region == user.region
      end
      can :read, HourlyPermit do |fourly_permit|
        fourly_permit.user.province == user.province && fourly_permit.user.region == user.region
      end
      can :search, HourlyPermit do |fourly_permit|
        fourly_permit.user.province == user.province && fourly_permit.user.region == user.region
      end
      # Can manage all owned records on Place model
      can :manage, Place, user_id: user.id
      # Can manage all owned records on Reason model
      can :manage, Reason, user_id: user.id
      # Can manage all owned records on Road model
      can :manage, Road, user_id: user.id
      # Can manage all owned records on Structure model
      can :manage, Structure, user_id: user.id
      # Can manage all owned records on Transport model
      can :manage, Transport, user_id: user.id
      # Can manage all owned records on Veichle model
      can :manage, Veichle, user_id: user.id
      # Can view Dashboard Whatsup
      can :whatsup, :dashboard
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
        refund.user_id == user.id
      end
      can :create, Refund
      can :update, Refund do |refund|
        refund.user_id == user.id
      end
      can :destroy, Refund do |refund|
        refund.user_id == user.id
      end
      can :read, Refund do |refund|
        refund.user_id == user.id
      end
      can :print, Refund do |refund|
        refund.user_id == user.id
      end
      can :print_list, Refund do |refund|
        refund.user_id == user.id
      end
      # Can manage all owned records on RefundClosure model
      can :read, RefundClosure do |refund_closure|
        refund_closure.user_id == user.id
      end
      can :create, RefundClosure
      can :update, RefundClosure do |refund_closure|
        refund_closure.user_id == user.id
      end
      can :destroy, RefundClosure do |refund_closure|
        refund_closure.user_id == user.id && refund_closure.payed != true
      end
      can :read, RefundClosure do |refund_closure|
        refund_closure.user_id == user.id
      end
      # Can manage all owned records on Holiday model
      can :read, Holiday do |holiday|
        holiday.user_id == user.id
      end
      can :create, Holiday
      can :update, Holiday do |holiday|
        holiday.user_id == user.id && holiday.processed != true
      end
      can :destroy, Holiday do |holiday|
        holiday.user_id == user.id && holiday.processed != true
      end
      can :read, Holiday do |holiday|
        holiday.user_id == user.id
      end
      can :search, Holiday do |holiday|
        holiday.user_id == user.id
      end
      # Can manage all owned records on HourlyHoliday model
      can :read, HourlyHoliday do |hourly_holiday|
        hourly_holiday.user_id == user.id
      end
      can :create, HourlyHoliday
      can :update, HourlyHoliday do |hourly_holiday|
        hourly_holiday.user_id == user.id && hourly_holiday.processed != true
      end
      can :destroy, HourlyHoliday do |hourly_holiday|
        hourly_holiday.user_id == user.id && hourly_holiday.processed != true
      end
      can :search, HourlyHoliday do |hourly_holiday|
        hourly_holiday.user_id == user.id
      end
      # Can manage all owned records on Disease model
      can :read, Disease do |disease|
        disease.user_id == user.id
      end
      can :create, Disease
      can :update, Disease do |disease|
        disease.user_id == user.id && disease.processed != true
      end
      can :destroy, Disease do |disease|
        disease.user_id == user.id && disease.processed != true
      end
      can :read, Disease do |disease|
        disease.user_id == user.id
      end
      can :search, Disease do |disease|
        disease.user_id == user.id
      end
      # Can manage all owned record on Permit model
      can :read, Permit do |permit|
        permit.user_id == user.id
      end
      can :create, Permit
      can :update, Permit do |permit|
        permit.user_id == user.id
      end
      can :destroy, Permit do |permit|
        permit.user_id == user.id
      end
      # Can manage all owned record on HourlyPermit model
      can :read, HourlyPermit do |hourly_permit|
        hourly_permit.user_id == user.id
      end
      can :create, HourlyPermit
      can :update, HourlyPermit do |hourly_permit|
        hourly_permit.user_id == user.id
      end
      can :destroy, HourlyPermit do |hourly_permit|
        hourly_permit.user_id == user.id
      end
      # Can manage all owned records on Place model
      can :manage, Place, user_id: user.id
      # Can manage all owned records on Reason model
      can :manage, Reason, user_id: user.id
      # Can manage all owned records on Road model
      can :manage, Road, user_id: user.id
      # Can manage all owned records on Structure model
      can :manage, Structure, user_id: user.id
      # Can manage all owned records on Transport model
      can :manage, Transport, user_id: user.id
      # Can manage all owned records on Veichle model
      can :manage, Veichle, user_id: user.id
    end
    # ==================================================================
    # *** Regular User ***
    # ==================================================================
  end
end
