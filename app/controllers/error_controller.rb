class ErrorController < ApplicationController

    def show
        status_code = params[:code] || 404
        flash.now[:danger] = "Status #{status_code}"
    end

end