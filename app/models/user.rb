class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :profile
  
  ROLES = %w[admin client]
  validates :role, inclusion: { in: ROLES }
  
  def admin?
    role == 'admin'
  end
  
  def client?
    role == 'client'
  end
end 