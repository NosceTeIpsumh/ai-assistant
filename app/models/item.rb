class Item < ApplicationRecord
  belongs_to :user
  has_many :chat_items

  validates :name, presence: true
  validates :brand, presence: true
  validates :category, presence: true
  validates :indice_gly, presence: true
  validates :ratio_glucide, presence: true
end
