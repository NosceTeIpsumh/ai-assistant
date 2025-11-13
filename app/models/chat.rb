class Chat < ApplicationRecord
  belongs_to :user
  has_many :chat_items, dependent: :destroy
  has_many :messages, dependent: :destroy

  DEFAULT_TITLE = "Untitled"
  TITLE_PROMPT = <<~PROMPT
    Generate the title of the recipe you proposed to the user
  PROMPT
  def generate_title_from_first_message
    return unless title == DEFAULT_TITLE

    first_user_message = messages.where(role: "user").order(:created_at).first
    return if first_user_message.nil?

    response = RubyLLM.chat.with_instructions(TITLE_PROMPT).ask(first_user_message.content)
    update(title: response.content)
  end
end
