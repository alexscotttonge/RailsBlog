module ApplicationHelper
  
  def markdown(text)
    redcarpet(redcarpet_renderer).render(text).html_safe
  end

  def redcarpet(renderer)
    Redcarpet::Markdown.new(renderer)
  end

  def redcarpet_renderer
    options = {
      hard_wrap: true,
      autolink: true
    }
    Redcarpet::Render::HTML.new(options)
  end
end
