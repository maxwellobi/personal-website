class AdminController < ActionController::Base
    skip_forgery_protection
    attr_reader :site_name

    def initialize
        super
        @site_name = "Maxwell Obi"
    end
end
