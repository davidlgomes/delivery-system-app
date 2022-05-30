class DeliveryPricesController < ApplicationController
    def index
        @delivery_prices = DeliveryPrice.all
    end
    def new
        @delivery_price = DeliveryPrice.new
    end
    def edit
        @delivery_price=DeliveryPrice.find(params[:id])
    end
    def create
        @delivery_price_params = params.require(:delivery_price).permit(:volume, :weight, :km_price, :name, :initial_price)
        @delivery_price = DeliveryPrice.new(@delivery_price_params)
        if @delivery_price.save()
            redirect_to @delivery_price, notice: 'Preço cadastrado com sucesso'
        else
            flash.now[:notice]='Não foi possível cadastrar o Preço'
            render 'new'
        end
    end
    def update
        @delivery_price=DeliveryPrice.find(params[:id])
        price_delivery_params=params.require(:delivery_price).permit(:volume, :weight, :km_price, :name, :initial_price)
        @delivery_price = DeliveryPrice.new(@delivery_price_params)
        if @delivery_price.update(price_delivery_params)
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