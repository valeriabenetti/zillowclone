 class User < ApplicationRecord
   has_secure_password

   has_many :homes
   has_many :favorites
end
