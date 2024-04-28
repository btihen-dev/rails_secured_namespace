class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :validatable

  normalizes :email, with: -> email { email.downcase.strip }
  normalizes :roles, with: -> roles { roles.map { |r| r.blank? ? 'user' : r }.uniq }
end
