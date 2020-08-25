# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    if user.is_admin?
      can :manage, :all
    end

     alias_action :create, :read, :update, :destroy, to: :crud

     can(:crud, Art) do |art|
      art.user == user
    end

    can(:crud, Comment) do |comment|
      comment.user == user 
    end


    can(:like, Art) do |art|
      user.persisted? && art.user != user
    end
   

    can(:destroy, Like) do |like|
      like.user == user 
    end

  end
end
