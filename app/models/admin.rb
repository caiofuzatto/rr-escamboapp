class Admin < ActiveRecord::Base
  # Constants
  ROLES = {:administrator => 0, :moderator => 1}
  
  # Enums
  enum role: ROLES

  # Scopes
  scope :with_administrator, -> { where(role: ROLES[:administrator]) }
  scope :with_moderator, -> { where(role: ROLES[:moderator]) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role_br
    if self.role == 'administrator'
      'Administrador'
    else
      'Moderador'
    end
  end
end
