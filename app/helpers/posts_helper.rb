module PostsHelper

  def is_the_next_post_last?(post)
    Post.last == post
  end

  def is_the_previous_post_first?(post)
    Post.first == post
  end


  def return_newer_post(post)

    if post.class == Post
      current_id = post.id.to_i
      current_id += 1
    else
      current_id = post + 1
    end

    begin
      return Post.find(current_id)
    rescue ActiveRecord::RecordNotFound
      return_newer_post(current_id)
    end

  end




  def return_older_post(post)

    if post.class == Post
      current_id = post.id.to_i
      current_id -=1
    else
      current_id = post - 1
    end

    begin
      return Post.find(current_id)
    rescue ActiveRecord::RecordNotFound
      return_older_post(current_id)
    end

  end



  def newer_post_path(post)
    newer_post = return_newer_post(post)
    completed_display_post_path(newer_post)
  end


  def older_post_path(post)
    older_post = return_older_post(post)
    completed_display_post_path(older_post)
  end

  def newer_post_title(post)
    newer_post = return_newer_post(post)
    newer_post.title.downcase
  end

  def older_post_title(post)
    older_post = return_older_post(post)
    older_post.title.downcase
  end


end
