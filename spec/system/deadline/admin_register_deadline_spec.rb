require 'rails_helper'

describe 'Usuário Cadastra um Preço' do
    it 'com sucesso' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        
        visit root_path
        click_on 'Prazos'
        click_on 'Cadastrar Prazos'
        fill_in 'Distância Mínima', with: '0' 
        fill_in 'Distância Máxima', with: '50'
        fill_in 'Dias Mínimo', with: '300' 
        fill_in 'Dias entrega', with:'100'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Prazo cadastrado com sucesso' 
 
    end
    it 'Com todos os dados em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        
        visit root_path
        click_on 'Prazos'
        click_on 'Cadastrar Prazos'
        fill_in 'Distância Mínima', with: '' 
        fill_in 'Distância Máxima', with: ''
        fill_in 'Dias Mínimo', with: '' 
        fill_in 'Dias entrega', with:''
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Prazo' 
    end
    it 'com apenas Distância Mínima em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        
        visit root_path
        click_on 'Prazos'
        click_on 'Cadastrar Prazos'
        fill_in 'Distância Mínima', with: '' 
        fill_in 'Distância Máxima', with: '50'
        fill_in 'Dias Mínimo', with: '300' 
        fill_in 'Dias entrega', with:'100'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Prazo' 
    end
    it 'com apenas Distância Máxima em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        visit root_path
        click_on 'Prazos'
        click_on 'Cadastrar Prazos'
        fill_in 'Distância Mínima', with: '0' 
        fill_in 'Distância Máxima', with: ''
        fill_in 'Dias Mínimo', with: '300' 
        fill_in 'Dias entrega', with:'100'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Prazo' 
    end
    it 'com apenas Dias Mínimo em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        
        visit root_path
        click_on 'Prazos'
        click_on 'Cadastrar Prazos'
        fill_in 'Distância Mínima', with: '0' 
        fill_in 'Distância Máxima', with: '50'
        fill_in 'Dias Mínimo', with: '' 
        fill_in 'Dias entrega', with:'100'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Prazo' 
    end
    it 'com apenas Dias entrega por Km em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        
        visit root_path
        click_on 'Prazos'
        click_on 'Cadastrar Prazos'
        fill_in 'Distância Mínima', with: '0' 
        fill_in 'Distância Máxima', with: '50'
        fill_in 'Dias Mínimo', with: '300' 
        fill_in 'Dias entrega', with:''
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Prazo' 
    end
end