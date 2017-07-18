class User < ApplicationRecord
  has_secure_password
  has_many :ratings
  validates :username, length:{ minimum: 5}
end
