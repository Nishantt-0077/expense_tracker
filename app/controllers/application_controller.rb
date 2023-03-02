class ApplicationController < ActionController::Base
    add_flash_types :danger, :info, :warning, :success
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
end
