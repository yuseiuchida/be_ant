class User < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :reactions, dependent: :destroy

  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, :name, uniqueness: true
  validates :email, :name, presence: true

  enum role: { general: 0, admin: 1 }
end
