class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, format: { with: /@sistemadefrete\.com.br/, message: 'Email deve possuir o domínio de @sistemadefrete.com.br' }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
