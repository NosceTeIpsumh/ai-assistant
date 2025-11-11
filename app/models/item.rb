class Item < ApplicationRecord
  belongs_to :user
  has_many :chat_items
end
