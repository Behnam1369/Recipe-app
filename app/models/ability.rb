class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :manage, Recipy, user_id: user.id
    can :manage, Food, user_id: user.id
  end
end
