require 'rails_helper'

describe 'Administrador remove uma Transportadora' do
    it 'com sucesso' do
        admin=Admin.create!(name: 'David', email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        visit root_path
        click_on "Oi"
        click_on 'Apagar'

        expect(current_path).to eq root_path
        expect(page).to have_content('Transportadora removida com sucesso')
        expect(page).not_to have_content('Oi')
        expect(page).not_to have_content('Brasil Telecom S/A')
    end
    it 'Sem permissão' do
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        visit root_path
        click_on "Oi"
        expect(page).not_to have_content('Transportadora removida com sucesso')
        expect(page).to have_field('E-mail')
        expect(page).to have_field('Senha')
    end
end