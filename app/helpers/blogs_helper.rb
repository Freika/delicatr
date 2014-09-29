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

end
