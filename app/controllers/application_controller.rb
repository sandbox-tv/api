class ApplicationController < ActionController::Base
  include AuthenticationController
  include SessionsHelper

  protect_from_forgery
  before_action :authenticate
  after_action :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def options
    cors_set_access_control_headers
    render nothing: true
  end
end
