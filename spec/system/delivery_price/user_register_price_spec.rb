require 'rails_helper'

describe 'Usuário Cadastra um Preço' do
    it 'com sucesso' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        
        visit root_path
        click_on 'Preços'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: 'Oferta' 
        fill_in 'Volume Menor', with: '50'
        fill_in 'Volume Maior', with: '300' 
        fill_in 'Peso Menor', with:'100'
        fill_in 'Peso Maior', with:'300' 
        fill_in 'Preço por Km' , with:'0.5' 
        fill_in 'Preço Inicial' , with:'5'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Preço cadastrado com sucesso' 
        expect(page).to have_content 'Nome: Oferta' 
        expect(page).to have_content 'Volume: 50.0 até 300.0' 
        expect(page).to have_content 'Peso: 100.0 até 300.0' 
        expect(page).to have_content 'Preço por Km: 0.5' 
        expect(page).to have_content 'Preço Inicial: 5.0' 
    end
    it 'Com todos os dados em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        login_adm(admin)
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: '' 
        fill_in 'Volume Maior', with: ''
        fill_in 'Volume Menor', with: '' 
        fill_in 'Peso Maior', with:''
        fill_in 'Peso Menor', with:'' 
        fill_in 'Preço por Km' , with:'' 
        fill_in 'Preço Inicial' , with:''
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end
    it 'com apenas Nome da oferta em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        login_adm(admin)
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: '' 
        fill_in 'Volume Maior', with: '300'
        fill_in 'Volume Menor', with: '300' 
        fill_in 'Peso Maior', with:'100' 
        fill_in 'Peso Menor', with:'100'
        fill_in 'Preço por Km' , with:'0.5' 
        fill_in 'Preço Inicial' , with:'5'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end
    it 'com apenas Volume em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        login_adm(admin)
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: ''
        fill_in 'Volume Menor', with: '' 
        fill_in 'Peso Menor', with:'100'
        fill_in 'Peso Maior', with:'100' 
        fill_in 'Preço por Km' , with:'0.5' 
        fill_in 'Preço Inicial' , with:'5'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end
    it 'com apenas Peso em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        login_adm(admin)
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: '300'
        fill_in 'Volume Menor', with: '300' 
        fill_in 'Peso Maior', with:''
        fill_in 'Peso Menor', with:'' 
        fill_in 'Preço por Km' , with:'0.5' 
        fill_in 'Preço Inicial' , with:'5'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end
    it 'com apenas Preço por Km em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        login_adm(admin)
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: '300'
        fill_in 'Volume Menor', with: '300' 
        fill_in 'Peso Maior', with:'100'
        fill_in 'Peso Menor', with:'100' 
        fill_in 'Preço por Km' , with:'' 
        fill_in 'Preço Inicial' , with:'5'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end
    it 'com apenas Preço Inicial em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        login_adm(admin)
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: '300'
        fill_in 'Volume Menor', with: '300' 
        fill_in 'Peso Maior', with:'100'
        fill_in 'Peso Menor', with:'100' 
        fill_in 'Preço por Km' , with:'0.5' 
        fill_in 'Preço Inicial' , with:''
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end
    it 'com nome já cadastrado' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        preço = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 300, smaller_weight: 100, larger_weight: 100,
                                      km_price: 0.50, name: 'Oferta Teste', initial_price: 5, carrier_management:primeiro_carrier_management)
        login_adm(admin)
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume Maior', with: '400'
        fill_in 'Volume Menor', with: '400' 
        fill_in 'Peso Maior', with:'200'
        fill_in 'Peso Menor', with:'200' 
        fill_in 'Preço por Km' , with:'0.7' 
        fill_in 'Preço Inicial' , with:'10'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end 
end