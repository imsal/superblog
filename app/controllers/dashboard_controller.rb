class DashboardController < ApplicationController

  before_action :author_must_be_signed_in_to_access

  def index
    @newest_posts = Post.where(active: true).order(created_at: :desc).first(25)

    @inactive_posts = Post.where(active: false)

    # @unanswered_comments

    @categories = Category.all

    # @tags =
  end


  def tags
    @tags = ActsAsTaggableOn::Tag.all
  end

end
