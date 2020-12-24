class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :first_name, presence:true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :last_name, presence:true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :first_name_kana, presence:true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :last_name_kana, presence:true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :birthday, presence:true
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  
  
end
