class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :teacher
      can :read, :all
      can :manage, Course
    else
        can :read, :all
    end
  end
end
