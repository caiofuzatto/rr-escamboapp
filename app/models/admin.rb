class Admin < ActiveRecord::Base
  enum role: [:administrator, :moderator]
  
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
