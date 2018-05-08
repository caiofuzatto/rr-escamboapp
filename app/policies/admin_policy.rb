class AdminPolicy < ApplicationPolicy
  
  def new?
    user.administrator?
  end

  def destroy?
    user.administrator?
  end

  def permitted_attributes
    if user.administrator?
      [:name, :email, :role, :password, :password_confirmation]
    else
      [:name, :email, :password, :password_confirmation]
    end
  end
  
  class Scope < Scope
    def resolve
      if user.administrator?
        scope.all
      else
        scope.with_moderator
      end
    end
  end
end
