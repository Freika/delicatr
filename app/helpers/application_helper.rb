module ApplicationHelper
  def gravatar_for(user, options = { size: 70 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=20"
    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  end

  def alert_class_for(flash_type)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def nice_russian_date(date)
    if date
      Russian::strftime(date.to_date, "%e %B %Y")
    else
      puts "Нет данных"
    end
  end

end
