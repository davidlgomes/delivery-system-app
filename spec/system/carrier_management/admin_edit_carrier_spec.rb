require 'rails_helper'
describe 'Usuário edita uma Transportadora' do 
    it 'a partir da página Específica' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
            
        visit root_path
        click_on "Oi"
        click_on "Editar"
        expect(page).to have_content('Editar Transportadora')
        expect(page).to have_field('Nome Fantasia', with:'Oi')
        expect(page).to have_field('Razão Social', with:'Brasil Telecom S/A')
        expect(page).to have_field('Domínio de E-mails', with: '@oi.com.br')
        expect(page).to have_field('Endereço para Faturamento', with:'Avenida do Faturamento, 1000')
        expect(page).to have_field('CNPJ', with: '76535764000143')
        
    end
    it 'com Sucesso' do 
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
            
        visit root_path
        click_on "Oi"
        click_on "Editar"
        fill_in 'Nome Fantasia', with: 'Oi Brasil'
        fill_in 'Razão Social', with: 'Brasil Telecom'
        fill_in 'Domínio de E-mails', with: '@oi.com.it'
        fill_in 'Endereço para Faturamento', with: 'Avenida do Faturamento, 100'
        fill_in 'CNPJ', with: '76535764000143'
        select 'Active', from: "Status"
        click_on "Enviar"
        expect(page).to have_content('Transportadora atualizada com sucesso')
        expect(page).to have_content('Oi Brasil')
        expect(page).to have_content('Razão Social: Brasil Telecom')
        expect(page).to have_content('Domínio de e-mail: @oi.com.it')
        expect(page).to have_content('Endereço para Faturamento: Avenida do Faturamento, 100')
        expect(page).to have_content('CNPJ: 76535764000143')
        expect(page).to have_content('Status: active')
    end
    it 'e mantém os campos obrigatórios' do 
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        
        visit root_path
        click_on "Oi"
        click_on "Editar"
        fill_in 'Nome Fantasia', with: ''
        fill_in 'Razão Social', with: 'Brasil Telecom'
        fill_in 'Domínio de E-mails', with: ''
        fill_in 'Endereço para Faturamento', with: ''
        fill_in 'CNPJ', with: '76535764000143'
        select 'Active', from: "Status"
        click_on "Enviar"

        expect(page).to have_content('Não foi possível atualizar a Transportadora')
    end
    
end