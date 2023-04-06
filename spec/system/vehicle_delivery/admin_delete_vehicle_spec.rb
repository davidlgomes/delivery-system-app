require 'rails_helper'

describe 'Usuário remove um veículo' do
    it 'com sucesso' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
                                                cnpj: '76535764000143', status: 'active')
        primeiro_veiculo = VehicleDelivery.create!(vehicle_plate: 'LDU2009' ,brand_vehicle: 'Chevrolet' , model_vehicle: 'Corsa' ,
                                                    year_of_manufacture: '2007' , maximum_load_capacity: '300', 
                                                    carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Veículo'
        click_on "LDU2009"
        click_on 'Apagar'

        expect(current_path).to eq root_path
        expect(page).to have_content('Veículo Apagado com sucesso')
        expect(page).not_to have_content('LDU2009')
    end
end