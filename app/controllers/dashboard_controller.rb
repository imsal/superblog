class DashboardController < ApplicationController

  http_basic_authenticate_with name: Rails.application.credentials.dig(:admin, :user_name), password: Rails.application.credentials.dig(:admin, :password)

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
