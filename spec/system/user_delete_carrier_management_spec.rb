require 'rails_helper'

describe 'Usuário remove um galpão' do
    it 'com sucesso' do
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143')
        visit root_path
        visit root_path
        click_on "Oi"
        click_on 'Apagar'

        expect(current_path).to eq root_path
        expect(page).to have_content('Transportadora removida com sucesso')
        expect(page).not_to have_content('Oi')
        expect(page).not_to have_content('Brasil Telecom S/A')
    end
end