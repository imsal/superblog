module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'My Company Name'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end


  def page_is_dashboard?
    request.original_url.include?('dashboard')
  end


  def completed_display_post_path(post)
    # display_post_path(post.year, post.month, post.day, post.slug)
    display_post_path(post.slug)
  end

  def is_category_active?(category)
    category.slug == request.path.split('/').last
  end

  def author_logged_in
    !session[:author_id].nil?
  end

end
