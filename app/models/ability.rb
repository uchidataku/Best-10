# frozen_string_literal: true
# Ability
class Ability
  include CanCan::Ability

  def initialize(account = Account.new)
    can :read, Account
    can :manage, Account, id: account.id
    can :read, Genre
    can :read, GenreCategory
    can %i[read create], GenreFollowing
    can :manage, GenreFollowing, account: account
    can %i[read create], Item
    can :manage, Item, account: account
    can :manage, Item, ranking_id: account.ranking_ids
    can %i[read create], Like
    can :manage, Like, account: account
    can %i[read create], Ranking
    can :manage, Ranking, creator: account

    return unless account.admin?

    can :manage, :all
  end

  def can?(action, subject, attribute = nil, *extra_args)
    subject.is_a?(Enumerable) ? subject.map { |a_subject| can?(action, a_subject) }.exclude?(false) : super
  end
end
