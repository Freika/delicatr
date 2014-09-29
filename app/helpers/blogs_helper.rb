module BlogsHelper

  def is_approved(blog)
    if blog.approved
      state = "Одобрен"
    else
      state = "На модерации"
    end
    state
  end

  def row_color(blog)
    unless blog.approved
      return "danger"
    end
  end

  def post_count(blog)
    how_much =  blog.posts.count
    posts = Russian.p(how_much, "пост", "поста", "постов")
    result = "#{how_much} #{posts}"
  end

  def how_old(blog)
    how_much = (Date.today.to_date - blog.created_at.to_date).to_i
    days = Russian.p(how_much, "день", "дня", "дней")
    result = "#{how_much} #{days}"
  end

end
