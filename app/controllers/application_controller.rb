require 'cancancan'
class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |_exception|
        redirect_to root_url, alert: "Access Denied"
      end
end
