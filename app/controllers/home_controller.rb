class HomeController < ApplicationController
    def index
        if current_user.role == "admin"
            redirect_to "/admin"
        elsif current_user.role == "seller"
            redirect_to sellers_path
        elsif current_user.role == "buyer"
            redirect_to buyer_listings_path
        end
    end
end