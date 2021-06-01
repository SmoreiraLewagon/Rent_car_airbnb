class CarPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  def is_owner?
    record.user == user || user.admin?
  end
end
