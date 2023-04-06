require 'rails_helper'

describe 'Usuario vê frota de veículo de uma transportadora' do
    it 'a partir do menu' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        visit root_path
        click_on 'Veículo'

        expect(current_path).to eq(vehicle_deliveries_path)
    end
    it 'com sucesso' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                                 domain_of_emails: '@oi.com.br', billing_address: 'Avenida da Fatura', 
                                                                cnpj: '76535764000143', status: 'active')
        primeiro_veiculo = VehicleDelivery.create!(vehicle_plate: 'LDU2009' ,brand_vehicle: 'Chevrolet' , model_vehicle: 'Corsa' ,
                                                  year_of_manufacture: '2007' , maximum_load_capacity: '300', 
                                                  carrier_management: primeiro_carrier_management)
        segundo_veiculo = VehicleDelivery.create!(vehicle_plate: 'LDU2010' ,brand_vehicle: 'FIAT' , model_vehicle: 'UNO' ,
                                                year_of_manufacture: '2009' , maximum_load_capacity: '400', 
                                                carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Veículo'
        expect(page).to have_link(primeiro_veiculo.vehicle_plate)
        expect(page).to have_link(segundo_veiculo.vehicle_plate)  
    end
    it 'com sucesso sem nada cadastrado' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                                 domain_of_emails: '@oi.com.br', billing_address: 'Avenida da Fatura', 
                                                                cnpj: '76535764000143', status: 'active')
        visit root_path
        click_on 'Veículo'
        expect(page).to have_content('Não existem Veículos cadastrados')
    end
end