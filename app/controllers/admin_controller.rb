class AdminController < ActionController::Base
    attr_reader :site_name

    def initialize
        super
        @site_name = "Maxwell Obi"
    end
end
