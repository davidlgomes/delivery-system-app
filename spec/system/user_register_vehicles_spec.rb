require 'rails_helper'

describe 'Usuário Cadastra um veículo' do
    it 'com sucesso' do
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida da Fatura', 
           cnpj: '76535764000143', status: 'active')

           visit root_path
           click_on 'Veículo'
           click_on 'Cadastrar Novo Veículo'
           fill_in 'Placa do Veículo', with: 'LDU-2010' 
           fill_in 'Marca', with: 'FIAT' 
           fill_in 'Modelo' , with:'UNO' 
           fill_in 'Ano de Fabricação' , with:'2009' 
           fill_in 'Capacidade Máxima de Carga' , with:'400'
           select 'Oi', from: 'Transportadora'
           click_on 'Enviar'
           expect(page).to have_content 'Veículo cadastrado com sucesso' 
           expect(page).to have_content 'Placa do Veículo: LDU-2010' 
           expect(page).to have_content 'Marca: FIAT' 
           expect(page).to have_content 'Ano de Fabricação: 2009' 
           expect(page).to have_content 'Modelo: UNO' 
           expect(page).to have_content 'Capacidade Máxima de Carga: 400' 
           expect(page).to have_content 'Oi' 
    end
end