class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    user ||= User.new # guest user (not logged in)

        if user.admin?
            can :manage, :all
            can :dashboard
            can :access, :rails_admin
        elsif user.instructor?

            # can :index, Course
            # can :read, Course
            # can :edit, Course
            # can :update, Course
            # can :create, Course
            # cannot use because when add not passing id use later
            # can :change_state, Course do |course|
            #     course.try(:user) == user
            # end
            # can :destroy, Course do |course|
            #     course.try(:user) == user
            # end
            # can :update, Course do |course|
            #     course.try(:user) == user
            # end
            can :manage, Course
        elsif user.student?
            can :read, Course
        else
            can :manage, :all
        end
  end
end
