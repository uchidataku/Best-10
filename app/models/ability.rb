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
    can %i[read create], Like
    can :manage, Like, account: account
    can %i[read create], Ranking
    can :manage, Ranking, creator: account
  end
end
