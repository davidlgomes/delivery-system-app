require 'rails_helper'
describe 'Usuário edita um preço' do 
    it 'com sucesso' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        preço = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 300, smaller_weight: 100, larger_weight: 100,
                                      km_price: 0.50, name: 'Oferta Teste', initial_price: 5, 
                                      carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste2' 
        fill_in 'Volume Maior', with: '400'
        fill_in 'Volume Menor', with: '400' 
        fill_in 'Peso Maior', with:'200'
        fill_in 'Peso Menor', with:'200' 
        fill_in 'Preço por Km' , with:'0.7' 
        fill_in 'Preço Inicial' , with:'10'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Preço Editado com sucesso' 
        expect(page).to have_content 'Nome: Oferta Teste2' 
        expect(page).to have_content 'Volume: 400.0 até 400.0' 
        expect(page).to have_content 'Peso: 200.0 até 200.0' 
        expect(page).to have_content 'Preço por Km: 0.7' 
        expect(page).to have_content 'Preço Inicial: 10' 
    end
    it 'com Nome da Oferta em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        preço = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 300, smaller_weight: 100, larger_weight: 100,
                                      km_price: 0.50, name: 'Oferta Teste', initial_price: 5,
                                      carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: '' 
        fill_in 'Volume Maior', with: '400'
        fill_in 'Volume Menor', with: '400' 
        fill_in 'Peso Maior', with:'200'
        fill_in 'Peso Menor', with:'200' 
        fill_in 'Preço por Km' , with:'0.7' 
        fill_in 'Preço Inicial' , with:'10'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço' 
    end
    it 'com Volume Maior em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        preço = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 300, smaller_weight: 100, larger_weight: 100,
                                      km_price: 0.50, name: 'Oferta Teste', initial_price: 5, 
                                      carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: ''
        fill_in 'Volume Menor', with: '400' 
        fill_in 'Peso Maior', with:'200'
        fill_in 'Peso Menor', with:'200' 
        fill_in 'Preço por Km' , with:'0.7' 
        fill_in 'Preço Inicial' , with:'10'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço'
    end
    it 'com Volume Menor em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        preço = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 300, smaller_weight: 100, larger_weight: 100,
                                      km_price: 0.50, name: 'Oferta Teste', initial_price: 5, 
                                      carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: '400'
        fill_in 'Volume Menor', with: '' 
        fill_in 'Peso Maior', with:'200'
        fill_in 'Peso Menor', with:'200' 
        fill_in 'Preço por Km' , with:'0.7' 
        fill_in 'Preço Inicial' , with:'10'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço'
    end
    it 'com Peso Maior em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        preço = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 300, smaller_weight: 100, larger_weight: 100,
                                      km_price: 0.50, name: 'Oferta Teste', initial_price: 5, 
                                      carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: '400'
        fill_in 'Volume Menor', with: '400' 
        fill_in 'Peso Maior', with:''
        fill_in 'Peso Menor', with:'200' 
        fill_in 'Preço por Km' , with:'0.7' 
        fill_in 'Preço Inicial' , with:'10'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço' 
    end
    it 'com Peso Menor em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        preço = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 300, smaller_weight: 100, larger_weight: 100,
                                      km_price: 0.50, name: 'Oferta Teste', initial_price: 5, 
                                      carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: '400'
        fill_in 'Volume Menor', with: '400' 
        fill_in 'Peso Maior', with:'200'
        fill_in 'Peso Menor', with:'' 
        fill_in 'Preço por Km' , with:'0.7' 
        fill_in 'Preço Inicial' , with:'10'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço' 
    end
    it 'com Preço por Km em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        preço = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 300, smaller_weight: 100, larger_weight: 100,
                                      km_price: 0.50, name: 'Oferta Teste', initial_price: 5, 
                                      carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: '400'
        fill_in 'Volume Menor', with: '400' 
        fill_in 'Peso Maior', with:'200'
        fill_in 'Peso Menor', with:'200' 
        fill_in 'Preço por Km' , with:'' 
        fill_in 'Preço Inicial' , with:'10'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço' 
    end
    it 'com Preço Inicial em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        preço = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 300, smaller_weight: 100, larger_weight: 100,
                                      km_price: 0.50, name: 'Oferta Teste', initial_price: 5, 
                                      carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: '400'
        fill_in 'Volume Menor', with: '400' 
        fill_in 'Peso Maior', with:'200'
        fill_in 'Peso Menor', with:'200' 
        fill_in 'Preço por Km' , with:'0.7' 
        fill_in 'Preço Inicial' , with:''
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço' 
    end
    it 'com Preço Inicial em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        preço = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 300, smaller_weight: 100, larger_weight: 100,
                                      km_price: 0.50, name: 'Oferta Teste', initial_price: 5, 
                                      carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: '400'
        fill_in 'Volume Menor', with: '400' 
        fill_in 'Peso Maior', with:'200'
        fill_in 'Peso Menor', with:'200' 
        fill_in 'Preço por Km' , with:'' 
        fill_in 'Preço Inicial' , with:'10'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço' 
    end
    it 'com nome já cadastrado' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        preço = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 600, smaller_weight: 100, larger_weight: 100,
                                      km_price: 0.50, name: 'Oferta Teste4', initial_price: 5, 
                                      carrier_management: primeiro_carrier_management)
        preço_comparativo = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 300, smaller_weight: 100, larger_weight: 100,
                                                  km_price: 0.50, name: 'Oferta Teste', initial_price: 5, 
                                                  carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: '400'
        fill_in 'Volume Menor', with: '400' 
        fill_in 'Peso Maior', with:'200'
        fill_in 'Peso Menor', with:'200' 
        fill_in 'Preço por Km' , with:'0.7' 
        fill_in 'Preço Inicial' , with:'10'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço' 
    end
end