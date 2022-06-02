class VehicleDeliveriesController < ApplicationController
    before_action :authenticate_admin!
    def index
        @vehicle_deliveries = VehicleDelivery.all
        
    end
    def new
        @carrier_managements=CarrierManagement.all
        @vehicle_delivery = VehicleDelivery.new
        
    end
    def edit
        @carrier_managements=CarrierManagement.all
        @vehicle_delivery=VehicleDelivery.find(params[:id])
        
    end
    def create
        @carrier_managements=CarrierManagement.all
        @vehicle_delivery_params = params.require(:vehicle_delivery).permit(:vehicle_plate, :brand_vehicle, 
                                                  :model_vehicle,:year_of_manufacture,:maximum_load_capacity,:carrier_management_id)
        @vehicle_delivery = VehicleDelivery.new(@vehicle_delivery_params)
        if @vehicle_delivery.save()
            redirect_to @vehicle_delivery, notice: 'Veículo cadastrado com sucesso'
        else
            flash.now[:notice]='Não foi possível cadastrar o Veículo'
            render 'new'
        end
    end
    def update
        @carrier_managements=CarrierManagement.all
        @vehicle_delivery=VehicleDelivery.find(params[:id])
        @vehicle_delivery_params=params.require(:vehicle_delivery).permit(:vehicle_plate, :brand_vehicle, 
                                               :model_vehicle,:year_of_manufacture,:maximum_load_capacity,
                                               :carrier_management_id)
        if @vehicle_delivery.update(@vehicle_delivery_params)
            redirect_to @vehicle_delivery, notice:'Veículo Editado com sucesso'
        else
            flash.now[:notice]='Não foi possível Editar o Veículo'
            render 'edit'
        end
    end
    def destroy
        @vehicle_delivery=VehicleDelivery.find(params[:id])
        @carrier_managements=CarrierManagement.all
        if @vehicle_delivery.delete
           redirect_to root_path, notice: 'Veículo Apagado com sucesso'
        end
    end
    def show
        @carrier_managements=CarrierManagement.all
        @vehicle_delivery=VehicleDelivery.find(params[:id])
    end
end