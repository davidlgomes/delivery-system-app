class DeadlinesController < ApplicationController
    before_action :authenticate_admin!
    def index
        @deadlines = Deadline.all
    end
    def new
        @carrier_managements=CarrierManagement.all
        @deadline = Deadline.new
    end
    def edit
        @carrier_managements=CarrierManagement.all
        @deadline=Deadline.find(params[:id])
    end
    def create
        @carrier_managements=CarrierManagement.all
        deadline_params=params.require(:deadline).permit(:minimum_distance,:maximum_distance, :minimum_of_days,:days_delivery,
                                                         :carrier_management_id)
        @deadline = Deadline.new(deadline_params)
        if @deadline.save()
            redirect_to @deadline, notice: 'Prazo cadastrado com sucesso'
        else
            flash.now[:notice]='Não foi possível cadastrar o Prazo'
            render 'new'
        end
    end
    def update
        @carrier_managements=CarrierManagement.all
        @deadline=Deadline.find(params[:id])
        deadline_params=params.require(:deadline).permit(:minimum_distance,:maximum_distance, :minimum_of_days,:days_delivery,
                                                         :carrier_management_id)
        @deadline = Deadline.new(deadline_params)
        if @deadline.update(deadline_params)
            redirect_to @deadline, notice:'Prazo Editado com sucesso'
        else
            flash.now[:notice]='Não foi possível Editar o Prazo'
            render 'edit'
        end
    end
    def destroy
        @deadline=Deadline.find(params[:id])
        if @deadline.delete
           redirect_to root_path, notice: 'Prazo Apagado com sucesso'
        end
    end
    def show
        @deadline=Deadline.find(params[:id])
    end
end