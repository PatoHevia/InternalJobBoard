class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    enum role: { admin: 0, user: 1 }
  
    has_many :applications
    has_many :job_offers, through: :applications
  
    validates :name, :email, :role, presence: true
    validates :email, uniqueness: true
  end
  