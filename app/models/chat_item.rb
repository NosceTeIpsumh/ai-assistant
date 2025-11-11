class ChatItem < ApplicationRecord
  belongs_to :chat
  belongs_to :item
end
