module StaticpagesHelper
  def current_index_page?
    current_page?(controller: 'staticpages', action: 'index')
  end
end
