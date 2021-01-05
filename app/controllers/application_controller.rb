class ApplicationController < ActionController::API
  include ExceptionHandler

  def routing_error
    render json: { error: "Routing error: #{params}"}, status: :not_found
  end
end
