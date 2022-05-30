require 'rails_helper'

describe 'Usuário Cadastra um Preço' do
    it 'com sucesso' do
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume', with: '300' 
        fill_in 'Peso', with:'100' 
        fill_in 'Preço por Km' , with:'0.5' 
        fill_in 'Preço Inicial' , with:'5'
        click_on 'Enviar'
        expect(page).to have_content 'Preço cadastrado com sucesso' 
        expect(page).to have_content 'Nome: Oferta Teste' 
        expect(page).to have_content 'Volume: 300.0' 
        expect(page).to have_content 'Peso: 100.0' 
        expect(page).to have_content 'Preço por Km: 0.5' 
        expect(page).to have_content 'Preço Inicial: 5.0' 
    end
    it 'Com todos os dados em branco' do
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: '' 
        fill_in 'Volume', with: '' 
        fill_in 'Peso', with:'' 
        fill_in 'Preço por Km' , with:'' 
        fill_in 'Preço Inicial' , with:''
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end
    it 'com apenas Nome da oferta em branco' do
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: '' 
        fill_in 'Volume', with: '300' 
        fill_in 'Peso', with:'100' 
        fill_in 'Preço por Km' , with:'0.5' 
        fill_in 'Preço Inicial' , with:'5'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end
    it 'com apenas Volume em branco' do
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume', with: '' 
        fill_in 'Peso', with:'100' 
        fill_in 'Preço por Km' , with:'0.5' 
        fill_in 'Preço Inicial' , with:'5'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end
    it 'com apenas Peso em branco' do
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume', with: '300' 
        fill_in 'Peso', with:'' 
        fill_in 'Preço por Km' , with:'0.5' 
        fill_in 'Preço Inicial' , with:'5'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end
    it 'com apenas Preço por Km em branco' do
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume', with: '300' 
        fill_in 'Peso', with:'100' 
        fill_in 'Preço por Km' , with:'' 
        fill_in 'Preço Inicial' , with:'5'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end
    it 'com apenas Preço Inicial em branco' do
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume', with: '300' 
        fill_in 'Peso', with:'100' 
        fill_in 'Preço por Km' , with:'0.5' 
        fill_in 'Preço Inicial' , with:''
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end
    it 'com nome já cadastrado' do
        preço = DeliveryPrice.create!(volume: 300, weight: 100, km_price: 0.50, name: 'Oferta Teste', initial_price: 5)
        visit root_path
        click_on 'Preço'
        click_on 'Cadastrar Preços'
        fill_in 'Nome da Oferta', with: 'Oferta Teste' 
        fill_in 'Volume', with: '400' 
        fill_in 'Peso', with:'200' 
        fill_in 'Preço por Km' , with:'0.7' 
        fill_in 'Preço Inicial' , with:'10'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Preço' 
    end 
end