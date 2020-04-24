module ApplicationHelper
  
  # ページ毎の完全なタイトル
  def full_title(page_title = '')
    base_title = "yumegulist"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end