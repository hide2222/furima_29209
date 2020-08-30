class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :user_items
  
   with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, length:{minimum: 6},format: { with: /\A[a-zA-Z0-9]+\z/}
        
   with_options format: { with: /\A[ぁ-んァ-ン一-龥]/} do
      validates :family_name
      validates :first_name
    end
        
   with_options format: { with: /\A[ァ-ヶー－]+\z/} do
      validates :family_name_kana
      validates :first_name_kana
    end
   end
end