class FlatPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
  #*------------------------------------*#
    #CRUD
  #*------------------------------------*#
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

  #*------------------------------------*#
    #OTHER
  #*------------------------------------*#

  def edit_publication?
    return true if user.present? && user == flat.user
  end

  def recap_publication?
    return true if user.present? && user == flat.user
  end

  def update_publication?
    return true if user.present? && user == flat.user
  end


  def upload_document?
    return true if user.present? && user == flat.user
  end

  def purge_document?
    return true if user.present? && user == flat.user
  end
  private

    def flat
      record
    end
end
