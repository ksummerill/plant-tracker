class Gardener < ActiveRecord::Base
  has_many :plants
  has_secure_password
  validates :username, :email, :password_digest, presence: true
  validates_uniqueness_of :username, case_sensitive: false

end
