# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    def initialize(user)
    
      if user.present?  # additional permissions for logged in users (they can read their own posts)
        can :manage, SupportRequest, user_id: user.id
        can :manage, UserDoc, user_id: user.id
        can :manage, User, id: user.id
  
        if user.role == 'Admin'  # additional permissions for administrators
          can :manage, SupportRequest
          can :manage, UserDoc
          can :manage, User
        end
      end
    end

  end
end
