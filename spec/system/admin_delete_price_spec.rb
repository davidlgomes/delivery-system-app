require 'rails_helper'
describe 'Usuário remove um Preço' do
    it 'com sucesso' do
        preço = DeliveryPrice.create!(volume: 300, weight: 100, km_price: 0.50, name: 'Oferta Teste4', initial_price: 5)
        visit root_path
        click_on 'Preços'
        click_on preço.name
        click_on 'Apagar'

        expect(current_path).to eq root_path
        expect(page).to have_content('Preço Apagado com sucesso')
        expect(page).not_to have_content(preço.name)
    end
end