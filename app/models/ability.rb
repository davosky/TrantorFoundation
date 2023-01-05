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
    if user.manager == true
      # Can manage all owned records on Refund module
      # Can manage all owned records on Refund module
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
      # Can manage all owned records on RefundClosure module
      can :create, RefundClosure
      can :update, RefundClosure do |refund_closure|
        refund_closure.user == user
      end
      can :destroy, RefundClosure do |refund_closure|
        refund_closure.user == user
      end
      can :read, RefundClosure do |refund_closure|
        refund_closure.user.province == user.province && refund_closure.user.region == user.region
      end

      can :search, RefundClosure do |refund_closure|
        refund_closure.user == user
      end
    end
    # ==================================================================
    # *** Manager ***
    # ==================================================================

    # ==================================================================
    # *** Regular User ***
    # ==================================================================
    if user.regular == true
      # Can manage all owned records on Refund module
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
      # Can manage all owned records on RefundClosure module
      can :create, RefundClosure
      can :update, RefundClosure do |refund_closure|
        refund_closure.user == user
      end
      can :destroy, RefundClosure do |refund_closure|
        refund_closure.user == user
      end
      can :read, RefundClosure do |refund_closure|
        refund_closure.user == user
      end
    end
    # ==================================================================
    # *** Regular User ***
    # ==================================================================
  end
end
