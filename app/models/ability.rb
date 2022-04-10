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
      can %i[read destroy], Message, user_id: user.id
      can :create, Message
    elsif user.has_role? :student
      can :read, :all
      can :manage, Review, reviewer_id: user.id
      can %i[edit destroy], User, user: user
      can %i[create destroy], Message
    else
      can :read, Subject
      can %i[read create], User
      can :read, Review

    end
  end
end
