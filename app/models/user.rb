class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 3 }, if: -> { new_record? || !password.nil? }
  validates :username, presence: true, uniqueness: true
end
