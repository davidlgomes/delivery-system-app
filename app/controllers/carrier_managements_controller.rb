class CarrierManagementsController < ApplicationController
    before_action :set_carrier_management, only:[:show, :edit, :update, :destroy]
    before_action :authenticate_admin!
    def show
    
    end
    def new
        @carrier_management=CarrierManagement.new()
    end

    def create
        carrier_management_params=params.require(:carrier_management).permit(:fancy_name, :social_reason, 
                                                :domain_of_emails, :cnpj, :billing_address, :status) 
        @carrier_management = CarrierManagement.new(carrier_management_params)
        if @carrier_management.save()
            redirect_to root_path, notice: 'Transportadora Cadastrada com Sucesso!'
        else 
            flash.now[:notice] = 'Transportadora não Cadastrada!'
            render 'new'
        end 
    end
    def edit; end
    
    def update
        carrier_management_params=params.require(:carrier_management).permit(:fancy_name, :social_reason, 
            :domain_of_emails, :cnpj, :billing_address, :status) 
        if @carrier_management.update(carrier_management_params)
            redirect_to carrier_management_path(@carrier_management.id), notice:'Transportadora atualizada com sucesso'
        else
            flash.now[:notice]='Não foi possível atualizar a Transportadora'
            render 'edit'
        end
    end   
    def destroy
        @carrier_management.destroy
        redirect_to root_path, notice:'Transportadora removida com sucesso'
    end
    private
        def set_carrier_management
            @carrier_management=CarrierManagement.find(params[:id])
        end   
end