class ApplicationController < ActionController::Base

  before_action :current_user

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  def current_user

    if !session[:author_id].nil?
      @current_user = Author.find(session[:author_id])
    else
      nil
    end

  end

  def author_must_be_signed_in_to_access
    redirect_to root_url, alert: 'You do not have permission to access this page.' if current_user.nil?
  end

end
