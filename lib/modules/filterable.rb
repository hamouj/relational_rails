module Filterable
  def filter_by_keyword_exact(keyword)
    where('name = ?', keyword)
  end

  def filter_by_keyword_partial(keyword)
    where("name LIKE ?", "%#{keyword}%")
  end

  def list_names
    pluck(:name)
  end
end