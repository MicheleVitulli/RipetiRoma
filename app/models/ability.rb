# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can %i[read create destroy], Subject
      can :read, Review
      can %i[read destroy], Message, user_id: user.id
      can :create, Message
      can :read, Teach
      can :read, Course
      can %i[read edit destroy], User
    elsif user.has_role? :teacher
      can %i[read create], Subject
      can :aggiungi_materia, Subject
      can :read, Review
      can %i[read destroy], Message, user_id: user.id
      can :create, Message
      can %i[read create destroy], Teach
      can :manage, Course, teacher_id: user.id
      can :manage, User, user: user
    elsif user.has_role? :student
      can :read, Subject
      can %i[read create], Review
      can :destroy, Review, reviewer_id: user.id
      can %i[read destroy], Message, user_id: user.id
      can :create, Message
      can :read, Teach
      can :read, Course, student_id: user.id
      can :manage, User, user: user
    else
      can :read, Subject
      can %i[read create], User
      can :read, Review
    end
  end
end
