class User < ApplicationRecord
  validates :username, presence: true, length: {maximum: 30},
            uniqueness: true
  has_secure_password
  validates :password, presence: true,
  length: { minimum: 4, maximum: 15 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
