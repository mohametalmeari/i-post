class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true,
                       format: { with: /\A[a-zA-Z][a-zA-Z0-9]*\z/, message: 'can only contain letters and numbers' }
  validates :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
return
