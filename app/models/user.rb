class User < ApplicationRecord
  after_create :welcome_send
  has_many :events, through: :attendances 
  has_many :attendances
  has_many :user_roles
  has_many :roles, through: :user_roles

  # Lien avec la table villager (page profil)
  has_one :villager
  has_one :village, through: :villager

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end