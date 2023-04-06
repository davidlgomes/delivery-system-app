require 'rails_helper'
describe 'Usuário remove um Preço' do
    it 'com sucesso' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        prazo = Deadline.create!(minimum_distance: 300, maximum_distance: 400, minimum_of_days: 2, days_delivery: 5,
                                 carrier_management:primeiro_carrier_management)
        visit root_path
        click_on 'Prazos'
        click_on "#{prazo.minimum_distance} até #{prazo.maximum_distance}"
        click_on 'Apagar'

        expect(current_path).to eq root_path
        expect(page).to have_content('Prazo Apagado com sucesso')
        expect(page).not_to have_link "#{prazo.minimum_distance} até #{prazo.maximum_distance}"
    end
end