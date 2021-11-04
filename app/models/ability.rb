# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user

    if user.role == 'User'
      can :manage, SupportRequest, user_id: user.id
      can :manage, UserDoc, user_id: user.id
      can :manage, User, id: user.id
    elsif user.role == 'Admin'  # additional permissions for administrators
      can :manage, SupportRequest
      can :manage, UserDoc
      can :manage, User
      cannot :manage, User, role: User::ROLES[2]
    elsif user.role == 'Super Admin'
      can :manage, :all
    end

  end

end
