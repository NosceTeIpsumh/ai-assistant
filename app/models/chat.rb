class Chat < ApplicationRecord
  belongs_to :user
  has_many :chat_items, dependent: :destroy
  has_many :messages, dependent: :destroy
end
