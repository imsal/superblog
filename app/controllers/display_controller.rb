class DisplayController < ApplicationController

  before_action :related_posts, only: :post

  def category
    @category = Category.find_by_slug(params[:slug])

    if @category.nil?
      redirect_to root_url, alert: "Invalid Url"
    else
      @posts = @category.posts.paginate(:page => params[:page], :per_page => 9)
    end

  end

  def post
    # SubscriberMailer.send_subscription_confirmation('s.tardibuono@live.com').deliver_now
    # if active // preview has been accepted

    @post = Post.find_by_slug(params[:slug])

    redirect_to root_url, alert: "Invalid Article Url" if @post.nil?

    @current_url = request.original_url
    @article_title = @post.title.gsub(' ', '%20')

    @post_images = @post.images

  end

  def tags
    @title = params[:tag_name]
    @posts = Post.tagged_with(params[:tag_name], :any => true).with_preloaded_main_image.paginate(:page => params[:page], :per_page => 9)# || not_found
  end


  private

  def related_posts
    @related_posts = Post.limit(12).order("RANDOM()") # Uses SQL to pull a random set of records

    ##################### by similar tag ###########################
    #
    # tag_name = @post.tags[rand(1..3)]
    #
    # tagged_posts = Post.tagged_with(tag_name)
    #
    # tagged_post = tagged_posts[rand(1..tagged_posts.count)]
    #
    # @related_posts.push(tagged_post)
  end



end
