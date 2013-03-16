module ApplicationHelper
  def markdown(text)
    options = { filter_html: true,
                auto_link: true,
                with_toc_data: true }
    extensions = { no_intra_emphasis: true,
                   fenced_code_blocks: true,
                   auto_link: true,
                   strikethrough: true }
    # renderer = PygmentizeHTML.new(options)
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end

  # class PygmentizeHTML < Redcarpet::Render::HTML
  #   def block_code(code, language)
  #     Pygmentize.process(code, language)
  #   end
  # end
end
