require 'rails_helper'
describe 'Usuário edita um Veículo' do 
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
        click_on 'LDU2009'
        click_on 'Editar'
        fill_in 'Placa do Veículo', with: 'LDU2011' 
        fill_in 'Marca', with: 'Chevrolet' 
        fill_in 'Modelo', with:'Corsa' 
        fill_in 'Ano de Fabricação' , with:'2006' 
        fill_in 'Capacidade Máxima de Carga' , with:'200'
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Veículo Editado com sucesso' 
        expect(page).to have_content 'Placa do Veículo: LDU2011' 
        expect(page).to have_content 'Marca: Chevrolet' 
        expect(page).to have_content 'Ano de Fabricação: 2006' 
        expect(page).to have_content 'Modelo: Corsa' 
        expect(page).to have_content 'Capacidade Máxima de Carga: 200' 
        expect(page).to have_content 'Oi' 
    end
    it 'com a placa do veículo com mais caracteres' do
        
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
        click_on 'LDU2009'
        click_on 'Editar'
        fill_in 'Placa do Veículo', with: 'LDU20110' 
        fill_in 'Marca', with: 'Chevrolet' 
        fill_in 'Modelo', with:'Corsa' 
        fill_in 'Ano de Fabricação', with:'2006' 
        fill_in 'Capacidade Máxima de Carga', with:'200'
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Veículo' 
    end
    it 'com a placa do veículo com menos caracteres' do
        
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
        click_on 'LDU2009'
        click_on 'Editar'
        fill_in 'Placa do Veículo', with: 'LDU201' 
        fill_in 'Marca', with: 'Chevrolet' 
        fill_in 'Modelo', with:'Corsa' 
        fill_in 'Ano de Fabricação', with:'2006' 
        fill_in 'Capacidade Máxima de Carga', with:'200'
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Veículo' 
    end
    it 'com a placa do veículo não sendo única' do
        
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                    domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
                                                    cnpj: '76535764000143', status: 'active')
        primeiro_veiculo = VehicleDelivery.create!(vehicle_plate: 'LDU2009', brand_vehicle: 'Chevrolet', model_vehicle: 'Corsa',
                                                    year_of_manufacture: 2007, maximum_load_capacity: '300', 
                                                    carrier_management: primeiro_carrier_management)
        segundo_veiculo = VehicleDelivery.create(vehicle_plate: 'LDU2009', brand_vehicle: 'Chevrolet1', model_vehicle: 'Corsa1',
                                                  year_of_manufacture: 2008, maximum_load_capacity: '400',
                                                  carrier_management: primeiro_carrier_management)                                          
        teste_uniquess=segundo_veiculo.valid?
        expect(teste_uniquess).to eq(false)
    end
    it 'com a placa em branco' do
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
        click_on 'LDU2009'
        click_on 'Editar'
        fill_in 'Placa do Veículo', with: '' 
        fill_in 'Marca', with: 'Chevrolet' 
        fill_in 'Modelo', with:'Corsa' 
        fill_in 'Ano de Fabricação', with:'2006' 
        fill_in 'Capacidade Máxima de Carga', with:'200'
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Veículo' 
    end
    it 'com a marca em branco' do
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
        click_on 'LDU2009'
        click_on 'Editar'
        fill_in 'Placa do Veículo', with: 'LDU2010' 
        fill_in 'Marca', with: '' 
        fill_in 'Modelo', with:'Corsa' 
        fill_in 'Ano de Fabricação', with:'2006' 
        fill_in 'Capacidade Máxima de Carga', with:'200'
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Veículo' 
    end
    it 'com o modelo em branco' do
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
        click_on 'LDU2009'
        click_on 'Editar'
        fill_in 'Placa do Veículo', with: 'LDU2010' 
        fill_in 'Marca', with: 'FIAT' 
        fill_in 'Modelo', with:'' 
        fill_in 'Ano de Fabricação', with:'2006' 
        fill_in 'Capacidade Máxima de Carga', with:'200'
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Veículo' 
    end
    it 'com o ano de fabricação em branco' do
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
        click_on 'LDU2009'
        click_on 'Editar'
        fill_in 'Placa do Veículo', with: 'LDU2010' 
        fill_in 'Marca', with: 'FIAT' 
        fill_in 'Modelo', with:'Uno' 
        fill_in 'Ano de Fabricação', with:'' 
        fill_in 'Capacidade Máxima de Carga', with:'200'
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Veículo' 
    end
    it 'com a capacidade máxima de carga de fabricação em branco' do
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
        click_on 'LDU2009'
        click_on 'Editar'
        fill_in 'Placa do Veículo', with: 'LDU2010' 
        fill_in 'Marca', with: 'FIAT' 
        fill_in 'Modelo', with:'Uno' 
        fill_in 'Ano de Fabricação', with:'2010' 
        fill_in 'Capacidade Máxima de Carga', with:''
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Veículo' 
    end
end