class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chats, dependent: :destroy
  has_many :items, dependent: :destroy
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 20 }
  before_save :downcase_username, if: -> { username.present? }

  private

  def downcase_username
    self.username = username.downcase
  end
end
