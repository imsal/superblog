class WelcomeController < ApplicationController
  def index
    @posts = Post.first(24)

    @featured_posts = Post.last(5)
  end
end
