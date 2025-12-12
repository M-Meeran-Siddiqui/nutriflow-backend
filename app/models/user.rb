class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise devise :database_authenticatable,
       :registerable,
       :recoverable,
       :rememberable,
       :validatable,
       :jwt_authenticatable,
       jwt_revocation_strategy: JwtDenylist


  def active_for_authentication?
    true
  end

  def rememberable?
    false
  end
end
