module ApplicationHelper
  def markdown(text)
    return "" if text.blank?

    Kramdown::Document.new(
      text,
      input: "GFM",
      syntax_highlighter: "rouge",
      hard_wrap: true
    ).to_html.html_safe
  end
end
