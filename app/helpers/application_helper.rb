module ApplicationHelper
  def markdown(text)
    options = { filter_html: true,
                with_toc_data: true }
    extensions = { no_intra_emphasis: true,
                   fenced_code_blocks: true,
                   auto_link: true,
                   strikethrough: true }
    coderayified = CodeRayify.new(options)
    markdown = Redcarpet::Markdown.new(coderayified, extensions)
    markdown.render(text).html_safe
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(line_numbers: :table,
                                       tab_width: 2)
    end
  end
end
