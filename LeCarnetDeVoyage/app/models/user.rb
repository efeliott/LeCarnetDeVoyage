class User < ApplicationRecord
  has_many :trips

  has_secure_password

  def admin?
    is_admin
  end
end
