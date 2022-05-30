require 'rails_helper'
describe 'Usuário edita um Veículo' do 
    it 'com sucesso' do
        preço = DeliveryPrice.create!(volume: 300, weight: 100, km_price: 0.50, name: 'Oferta Teste', initial_price: 5)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste2' 
        fill_in 'Volume', with: '3000' 
        fill_in 'Peso', with:'1000' 
        fill_in 'Preço por Km' , with:'0.53' 
        fill_in 'Preço Inicial' , with:'54'
        click_on 'Enviar'
        expect(page).to have_content 'Preço Editado com sucesso' 
        expect(page).to have_content 'Nome: Oferta Teste2' 
        expect(page).to have_content 'Volume: 3000' 
        expect(page).to have_content 'Peso: 1000' 
        expect(page).to have_content 'Preço por Km: 0.53' 
        expect(page).to have_content 'Preço Inicial: 54' 
    end
    it 'com Nome da Oferta em branco' do
        preço = DeliveryPrice.create!(volume: 300, weight: 100, km_price: 0.50, name: 'Oferta Teste', initial_price: 5)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: '' 
        fill_in 'Volume', with: '3000' 
        fill_in 'Peso', with:'1000' 
        fill_in 'Preço por Km' , with:'0.53' 
        fill_in 'Preço Inicial' , with:'54'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço' 
    end
    it 'com Volume em branco' do
        preço = DeliveryPrice.create!(volume: 300, weight: 100, km_price: 0.50, name: 'Oferta Teste', initial_price: 5)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste2' 
        fill_in 'Volume', with: '' 
        fill_in 'Peso', with:'1000' 
        fill_in 'Preço por Km' , with:'0.53' 
        fill_in 'Preço Inicial' , with:'54'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço'
    end
    it 'com Peso em branco' do
        preço = DeliveryPrice.create!(volume: 300, weight: 100, km_price: 0.50, name: 'Oferta Teste', initial_price: 5)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste2' 
        fill_in 'Volume', with: '3000' 
        fill_in 'Peso', with:'' 
        fill_in 'Preço por Km' , with:'0.53' 
        fill_in 'Preço Inicial' , with:'54'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço'
    end
    it 'com Preço por Km em branco' do
        preço = DeliveryPrice.create!(volume: 300, weight: 100, km_price: 0.50, name: 'Oferta Teste', initial_price: 5)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste2' 
        fill_in 'Volume', with: '3000' 
        fill_in 'Peso', with:'1000' 
        fill_in 'Preço por Km' , with:'' 
        fill_in 'Preço Inicial' , with:'54'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço' 
    end
    it 'com Preço Inicial em branco' do
        preço = DeliveryPrice.create!(volume: 300, weight: 100, km_price: 0.50, name: 'Oferta Teste', initial_price: 5)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste2' 
        fill_in 'Volume', with: '3000' 
        fill_in 'Peso', with:'1000' 
        fill_in 'Preço por Km' , with:'0.53' 
        fill_in 'Preço Inicial' , with:''
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço' 
    end
    it 'com nome já cadastrado' do
        preço = DeliveryPrice.create!(volume: 300, weight: 100, km_price: 0.50, name: 'Oferta Teste', initial_price: 5)
        preço_comparativo = DeliveryPrice.create!(volume: 400, weight: 200, km_price: 0.70, name: 'Oferta Teste2', initial_price: 26)
        visit root_path
        click_on 'Preço'
        click_on preço.name
        click_on 'Editar'
        fill_in 'Nome da Oferta', with: 'Oferta Teste2' 
        fill_in 'Volume', with: '3000' 
        fill_in 'Peso', with:'1000' 
        fill_in 'Preço por Km' , with:'0.53' 
        fill_in 'Preço Inicial' , with:'54'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Preço' 
    end
end