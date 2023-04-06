class HomeController < ApplicationController
    def index
        @carrier_managements = CarrierManagement.all
    end
end