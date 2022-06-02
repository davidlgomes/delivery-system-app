require 'rails_helper'
describe 'Usuário remove um Preço' do
    it 'com sucesso' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        preço = DeliveryPrice.create!(smaller_volume: 300, larger_volume: 300, smaller_weight: 100, larger_weight: 100,
                                      km_price: 0.50, name: 'Oferta Teste', initial_price: 5, carrier_management: primeiro_carrier_management)
        visit root_path
        click_on 'Preços'
        click_on preço.name
        click_on 'Apagar'

        expect(current_path).to eq root_path
        expect(page).to have_content('Preço Apagado com sucesso')
        expect(page).not_to have_content(preço.name)
    end
end