class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user
  
    if user.role == "admin"
      can :manage, :all
    elsif user.role == "seller"
      # a seller can manage any active auction that belongs to him
      can :create, Auction 
      can [:update, :destroy], Auction, :user_id => user.id
      can :read, Auction
      can :read, Bid, :auction => { :id => user.auction_ids }
      cannot [:update, :destroy], Bid
    elsif user.role == "buyer"
      can :read, Auction
      cannot [:create, :update, :destroy], Auction
      can :create, Bid
      can [:read, :update, :destroy], Bid, :user_id => user.id
      can :manage, Transaction
      #cannot :manage, Bid, :user_id != user.id
    end

  end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
end
