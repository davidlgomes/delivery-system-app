class DeliveryPricesController < ApplicationController
    before_action :authenticate_admin!
    def index
        @delivery_prices = DeliveryPrice.all
    end
    def new
        @carrier_managements=CarrierManagement.all
        @delivery_price = DeliveryPrice.new
    end
    def edit
        @carrier_managements=CarrierManagement.all
        @delivery_price=DeliveryPrice.find(params[:id])
    end
    def create
        @carrier_managements=CarrierManagement.all
        delivery_price_params=params.require(:delivery_price).permit(:smaller_volume, :larger_volume, :larger_weight, 
                                                                     :smaller_weight, :km_price, :name, :initial_price, 
                                                                     :carrier_management_id)
        @delivery_price = DeliveryPrice.new(delivery_price_params)
        if @delivery_price.save()
            redirect_to @delivery_price, notice: 'Preço cadastrado com sucesso'
        else
            flash.now[:notice]='Não foi possível cadastrar o Preço'
            render 'new'
        end
    end
    def update
        @carrier_managements=CarrierManagement.all
        @delivery_price=DeliveryPrice.find(params[:id])
        delivery_price_params=params.require(:delivery_price).permit(:smaller_volume, :larger_volume, :larger_weight, 
                                                                     :smaller_weight, :km_price, :name, :initial_price,
                                                                     :carrier_management_id)
        @delivery_price = DeliveryPrice.new(delivery_price_params)
        if @delivery_price.update(delivery_price_params)
            redirect_to @delivery_price, notice:'Preço Editado com sucesso'
        else
            flash.now[:notice]='Não foi possível Editar o Preço'
            render 'edit'
        end
    end
    def destroy
        @delivery_price=DeliveryPrice.find(params[:id])
        if @delivery_price.delete
           redirect_to root_path, notice: 'Preço Apagado com sucesso'
        end
    end
    def show
        @delivery_price=DeliveryPrice.find(params[:id])
    end
end