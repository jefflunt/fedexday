class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    def redirect_back_or(path, response_status = {})
      redirect_to :back, response_status
      rescue ActionController::RedirectBackError
        redirect_to path, response_status
    end
end
