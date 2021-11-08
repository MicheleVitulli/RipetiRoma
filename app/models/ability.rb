class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :teacher
      can :read, :all
      can :manage, Course
      can :aggiungi_materia, Subject
    else
        can :read, :all
    end
  end
end
