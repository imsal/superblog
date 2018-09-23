class ApplicationController < ActionController::Base



  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  def digest(string)
    BCrypt::Password.create(string)
  end

  # before_filter :authenticate
  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(username, "admin") &&
      ActiveSupport::SecurityUtils.secure_compare(password, "password")
    end
  end

end
