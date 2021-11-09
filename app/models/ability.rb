class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :teacher
      can :read, :all
      can :manage, Course, teacher_id: user.id
      can :manage, Teach, teacher_id: user.id
      can :read, Review
      can :aggiungi_materia, Subject
      can [:edit, :destroy], User, user: user
    elsif user.has_role? :student
        can :read, :all
        can :manage, Review, reviewer_id: user.id
        can [:edit, :destroy], User, user: user
    else
        can :read, Subject
        can [:read, :create], User
        can :read, Review

    end
  end
end
