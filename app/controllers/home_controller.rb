class HomeController < ApplicationController
    def index
        if current_user.role == "admin"
        elsif current_user.role == "vendor"
        elsif current_user.role == "buyer"
            redirect_to buyer_listings_path
        end
    end
end