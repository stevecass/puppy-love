class Owner < ActiveRecord::Base
  has_secure_password
  has_many :dogs
end
