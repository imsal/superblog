class ApplicationController < ActionController::Base

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  # def not_found
  #   raise ActionController::RoutingError.new('Not Found')
  # rescue
  #   render_404
  # end
  #
  # def render_404
  #   render 'errors/not_found' ,status: 404
  # end
  #
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found
  # rescue_from ActionController::RoutingError, with: :not_found
  # rescue_from ActionController::ParameterMissing, with: :render_400
  # rescue_from ActionController::InvalidAuthenticityToken, with: :render_400




  # rescue_from ActionController::RoutingError do |exception|
  #  logger.error 'Routing error occurred'
  #  return render_not_found if not_found
  # end
  #
  #
  # def render_not_found
  #   render :file => "#{RAILS_ROOT}/public/404.html",  :status => 404
  # end
  #
  # def not_found
  #   raise ActionController::RoutingError.new('Not Found')
  # end

end
