require 'rails_helper'

describe 'Usuário Cadastra um veículo' do
    it 'com sucesso' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                                domain_of_emails: '@oi.com.br', billing_address: 'Avenida da Fatura', 
                                                                cnpj: '76535764000143', status: 'active')
        segundo_carrier_management = CarrierManagement.create!(fancy_name: 'Oi1', social_reason: 'Brasil Telecom S/A1', 
                                                          domain_of_emails: '@oi.com.it', billing_address: 'Avenida da Fartura', 
                                                          cnpj: '04577737000122', status: 'active')
        visit root_path
        click_on 'Veículo'
        click_on 'Cadastrar Novo Veículo'
        fill_in 'Placa do Veículo', with: 'LDU2010' 
        fill_in 'Marca', with: 'FIAT' 
        fill_in 'Modelo', with:'UNO' 
        fill_in 'Ano de Fabricação' , with:'2009' 
        fill_in 'Capacidade Máxima de Carga' , with:'400'
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Veículo cadastrado com sucesso' 
        expect(page).to have_content 'Placa do Veículo: LDU2010' 
        expect(page).to have_content 'Marca: FIAT' 
        expect(page).to have_content 'Ano de Fabricação: 2009' 
        expect(page).to have_content 'Modelo: UNO' 
        expect(page).to have_content 'Capacidade Máxima de Carga: 400' 
        expect(page).to have_content 'Oi' 
    end
    it 'Com todos os dados em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                                domain_of_emails: '@oi.com.br', billing_address: 'Avenida da Fatura', 
                                                                cnpj: '76535764000143', status: 'active')
        segundo_carrier_management = CarrierManagement.create!(fancy_name: 'Oi1', social_reason: 'Brasil Telecom S/A1', 
                                                          domain_of_emails: '@oi.com.it', billing_address: 'Avenida da Fartura', 
                                                          cnpj: '04577737000122', status: 'active')
        visit root_path
        click_on 'Veículo'
        click_on 'Cadastrar Novo Veículo'
        fill_in 'Placa do Veículo', with: '' 
        fill_in 'Marca', with: '' 
        fill_in 'Modelo', with:'' 
        fill_in 'Ano de Fabricação' , with:'' 
        fill_in 'Capacidade Máxima de Carga' , with:''
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Veículo' 
        expect(page).to have_content 'Placa do Veículo não pode ficar em branco' 
        expect(page).to have_content 'Marca não pode ficar em branco' 
        expect(page).to have_content 'Modelo não pode ficar em branco' 
        expect(page).to have_content 'Ano de Fabricação não pode ficar em branco' 
        expect(page).to have_content 'Placa do Veículo não possui o tamanho esperado (7 caracteres)' 
    end
    it 'com apenas Placa do Veículo em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                                domain_of_emails: '@oi.com.br', billing_address: 'Avenida da Fatura', 
                                                                cnpj: '76535764000143', status: 'active')
        segundo_carrier_management = CarrierManagement.create!(fancy_name: 'Oi1', social_reason: 'Brasil Telecom S/A1', 
                                                          domain_of_emails: '@oi.com.it', billing_address: 'Avenida da Fartura', 
                                                          cnpj: '04577737000122', status: 'active')
        visit root_path
        click_on 'Veículo'
        click_on 'Cadastrar Novo Veículo'
        fill_in 'Placa do Veículo', with: '' 
        fill_in 'Marca', with: 'FIAT' 
        fill_in 'Modelo', with:'UNO' 
        fill_in 'Ano de Fabricação' , with:'2009' 
        fill_in 'Capacidade Máxima de Carga' , with:'400'
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Veículo' 
        expect(page).to have_content 'Placa do Veículo não pode ficar em branco' 
    end
    it 'com apenas Marca em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                                domain_of_emails: '@oi.com.br', billing_address: 'Avenida da Fatura', 
                                                                cnpj: '76535764000143', status: 'active')
        segundo_carrier_management = CarrierManagement.create!(fancy_name: 'Oi1', social_reason: 'Brasil Telecom S/A1', 
                                                          domain_of_emails: '@oi.com.it', billing_address: 'Avenida da Fartura', 
                                                          cnpj: '04577737000122', status: 'active')
        visit root_path
        click_on 'Veículo'
        click_on 'Cadastrar Novo Veículo'
        fill_in 'Placa do Veículo', with: 'LDU2010' 
        fill_in 'Marca', with: '' 
        fill_in 'Modelo', with:'UNO' 
        fill_in 'Ano de Fabricação' , with:'2009' 
        fill_in 'Capacidade Máxima de Carga' , with:'400'
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Veículo' 
        expect(page).to have_content 'Marca não pode ficar em branco'
    end
    it 'com apenas Modelo em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                                domain_of_emails: '@oi.com.br', billing_address: 'Avenida da Fatura', 
                                                                cnpj: '76535764000143', status: 'active')
        segundo_carrier_management = CarrierManagement.create!(fancy_name: 'Oi1', social_reason: 'Brasil Telecom S/A1', 
                                                          domain_of_emails: '@oi.com.it', billing_address: 'Avenida da Fartura', 
                                                          cnpj: '04577737000122', status: 'active')
        visit root_path
        click_on 'Veículo'
        click_on 'Cadastrar Novo Veículo'
        fill_in 'Placa do Veículo', with: 'LDU2010' 
        fill_in 'Marca', with: 'FIAT' 
        fill_in 'Modelo', with:'' 
        fill_in 'Ano de Fabricação' , with:'2009' 
        fill_in 'Capacidade Máxima de Carga' , with:'400'
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Veículo' 
        expect(page).to have_content 'Modelo não pode ficar em branco' 
    end
    it 'com apenas Ano de Fabricação em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                                domain_of_emails: '@oi.com.br', billing_address: 'Avenida da Fatura', 
                                                                cnpj: '76535764000143', status: 'active')
        segundo_carrier_management = CarrierManagement.create!(fancy_name: 'Oi1', social_reason: 'Brasil Telecom S/A1', 
                                                          domain_of_emails: '@oi.com.it', billing_address: 'Avenida da Fartura', 
                                                          cnpj: '04577737000122', status: 'active')
        visit root_path
        click_on 'Veículo'
        click_on 'Cadastrar Novo Veículo'
        fill_in 'Placa do Veículo', with: 'LDU2010' 
        fill_in 'Marca', with: 'FIAT' 
        fill_in 'Modelo', with:'UNO' 
        fill_in 'Ano de Fabricação' , with:'' 
        fill_in 'Capacidade Máxima de Carga' , with:'400'
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Veículo' 
        expect(page).to have_content 'Ano de Fabricação não pode ficar em branco' 
    end
    it 'com apenas Ano de Fabricação em branco' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                                domain_of_emails: '@oi.com.br', billing_address: 'Avenida da Fatura', 
                                                                cnpj: '76535764000143', status: 'active')
        segundo_carrier_management = CarrierManagement.create!(fancy_name: 'Oi1', social_reason: 'Brasil Telecom S/A1', 
                                                          domain_of_emails: '@oi.com.it', billing_address: 'Avenida da Fartura', 
                                                          cnpj: '04577737000122', status: 'active')
        visit root_path
        click_on 'Veículo'
        click_on 'Cadastrar Novo Veículo'
        fill_in 'Placa do Veículo', with: 'LDU2010' 
        fill_in 'Marca', with: 'FIAT' 
        fill_in 'Modelo', with:'UNO' 
        fill_in 'Ano de Fabricação' , with:'2009' 
        fill_in 'Capacidade Máxima de Carga' , with:''
        select 'Oi', from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível cadastrar o Veículo' 
        expect(page).to have_content 'Capacidade Máxima de Carga não pode ficar em branco' 
    end
    
end