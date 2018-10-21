class ApplicationController < ActionController::Base
    attr_reader :site_name

    def initialize
        super
        @site_name = "Maxwell Obi | Software Engineer and Entrepreneur"
        @site_desc = "Maxwell Obi is the Co-founder and CTO of Amplified Payments. He holds a Bachelor of Science Degree in Computer Science and has vast Software Engineering experience";
    end

    def not_found
        #raise ActionController::RoutingError.new('Not Found')
        redirect_to '/404'
    end

    private
        def current_user
            @current_user ||= User.find(session[:user_id]) if session[:user_id]
        end

    helper_method :current_user
end
