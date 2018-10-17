class ApplicationController < ActionController::Base
    attr_reader :site_name

    def initialize
        super
        @site_name = "Maxwell Obi - Senior Software Engineer"
    end

    private
        def current_user
            @current_user ||= User.find(session[:user_id]) if session[:user_id]
        end

    helper_method :current_user
end
