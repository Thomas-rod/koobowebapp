class FlatPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def show?
    return true if (user.present? && user == flat.user) || user.renter == false
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == flat.user
  end

  def destroy?
    return true if user.present? && user == flat.user
  end

  private

    def flat
      record
    end
end
