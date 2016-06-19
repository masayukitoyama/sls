class ApiApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :api_authenticate_user!
  skip_before_filter :verify_authenticity_token if :json_request?

  def api_authenticate_user!
    unless user_signed_in?
      error("not authenticate user", 400)
    end
  end

  def json_request?
     request.format.json?
  end
end
