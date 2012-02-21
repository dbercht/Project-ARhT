class Ability
  include CanCan::Ability

  def initialize(user)
		user ||= User.new # guest user (not logged in)
    if user.therapist?
			can :create, :all
      can :manage, User, :role => User::ROLES[0], :inverse_clinic => { :id => user.clinic_ids }
      can :manage, Clinic, :therapist_id => user.id
      can :manage, ClientSession, :clinic => { :therapist_id => user.id }
			can :manage, Gesture
			can :manage, GestureSample
			can :manage, Classifier
    elsif user.client?
			can :manage, GestureSample
			can :read, User, :id => user.id
		end
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
end
