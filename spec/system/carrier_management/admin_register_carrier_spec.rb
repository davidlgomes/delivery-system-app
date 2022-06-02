require 'rails_helper'

describe 'Usuário cadastra uma Transportadora' do 
    it 'a partir da tela inicial' do
        #Arrange
        admin=Admin.create!(name: 'David', email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        #Act
        visit(root_path)
        click_on('Cadastrar Transportadora')
        
        #Assert
        expect(page).to have_field('Nome Fantasia')
        expect(page).to have_field('Razão Social')
        expect(page).to have_field('Domínio de E-mails')
        expect(page).to have_field('Endereço para Faturamento')
        expect(page).to have_field('CNPJ')
    end
    it 'e com sucesso' do
        #Arrange
        admin=Admin.create!(name: 'David', email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        #Act
        visit root_path
        click_on('Cadastrar Transportadora')
        fill_in 'Nome Fantasia', with: 'Oi'
        fill_in 'Razão Social', with: 'Brasil Telecom S/A'
        fill_in 'Domínio de E-mails', with: '@oi.com.br'
        fill_in 'Endereço para Faturamento', with: 'Avenida do Faturamento, 1000'
        fill_in 'CNPJ', with: '76535764000143'
        select 'Active', from: "Status"
        click_on 'Enviar'
        
        #Assert
        expect(current_path).to eq root_path
        expect(page).to have_content 'Transportadora Cadastrada com Sucesso'
        expect(page).to have_content 'Oi'
        expect(page).to have_content 'Brasil Telecom S/A'
        expect(page).to have_content '@oi.com.br'
        expect(page).to have_content 'Avenida do Faturamento, 1000'
        expect(page).to have_content '76535764000143'
        expect(page).to have_content('Status: active')

    end
    it 'com todos os dados incompletos' do
        #Arrange
        admin=Admin.create!(name: 'David', email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        #Act
        visit(root_path)
        click_on('Cadastrar Transportadora')
        fill_in 'Nome Fantasia', with: ''
        fill_in 'Razão Social', with: ''
        fill_in 'Domínio de E-mails', with: ''
        fill_in 'Endereço para Faturamento', with: ''
        fill_in 'CNPJ', with: ''
        select 'Active', from: "Status"
        click_on('Enviar')
        #Assert
        expect(page).to have_content 'Transportadora não Cadastrada!'
        expect(page).to have_content 'Nome Fantasia não pode ficar em branco'
        expect(page).to have_content 'Razão Social não pode ficar em branco'
        expect(page).to have_content 'Domínio de E-mails não pode ficar em branco'
        expect(page).to have_content 'Endereço para Faturamento não pode ficar em branco'
        expect(page).to have_content 'CNPJ não pode ficar em branco'
    end
    it 'com CNPJ inválido' do
        #Arrange
        admin=Admin.create!(name: 'David', email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        #Act
        visit(root_path)
        click_on('Cadastrar Transportadora')
        fill_in 'Nome Fantasia', with: 'Oi'
        fill_in 'Razão Social', with: 'Brasil Telecom S/A'
        fill_in 'Domínio de E-mails', with: '@oi.com.br'
        fill_in 'Endereço para Faturamento', with: 'Avenida do Faturamento, 1000'
        fill_in 'CNPJ', with: '11111111111111'
        select 'Active', from: "Status"
        click_on 'Enviar'
        
        #Assert
        expect(page).to have_content 'Transportadora não Cadastrada!'
        expect(page).to have_content 'CNPJ não é válido'
    end
    it 'com CNPJ com mais caracteres' do
        #Arrange
        admin=Admin.create!(name: 'David', email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        #Act
        visit(root_path)
        click_on('Cadastrar Transportadora')
        fill_in 'Nome Fantasia', with: 'Oi'
        fill_in 'Razão Social', with: 'Brasil Telecom S/A'
        fill_in 'Domínio de E-mails', with: '@oi.com.br'
        fill_in 'Endereço para Faturamento', with: 'Avenida do Faturamento, 1000'
        fill_in 'CNPJ', with: '765357640001434'
        select 'Active', from: "Status"
        click_on 'Enviar'
        
        #Assert
        expect(page).to have_content 'Transportadora não Cadastrada!'
        expect(page).to have_content 'CNPJ não é válido'
    end
    it 'com CNPJ com menos caracteres' do
        #Arrange
        admin=Admin.create!(name: 'David', email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        #Act
        visit(root_path)
        click_on('Cadastrar Transportadora')
        fill_in 'Nome Fantasia', with: 'Oi'
        fill_in 'Razão Social', with: 'Brasil Telecom S/A'
        fill_in 'Domínio de E-mails', with: '@oi.com.br'
        fill_in 'Endereço para Faturamento', with: 'Avenida do Faturamento, 1000'
        fill_in 'CNPJ', with: '7653576400014'
        select 'Active', from: "Status"
        click_on 'Enviar'
        
        #Assert
        expect(page).to have_content 'Transportadora não Cadastrada!'
        expect(page).to have_content 'CNPJ não é válido'
    end
    it 'com CNPJ já cadastrado' do
        #Arrange
        admin=Admin.create!(name: 'David', email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
                                                cnpj: '76535764000143', status: 'active')
        segundo_carrier_management = CarrierManagement.create(fancy_name: 'Oi1', social_reason: 'Brasil Telecom S/A2', 
                                                    domain_of_emails: '@oi.com.it', billing_address: 'Avenida do Faturamento, 100', 
                                                    cnpj: '76535764000143', status: 'active')
        #Act
        teste_uniquess=segundo_carrier_management.valid?
        #Assert
        expect(teste_uniquess).to eq false
    end
    it 'com nome fantasia já cadastrado' do
        #Arrange
        admin=Admin.create!(name: 'David', email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
                                                cnpj: '76535764000143', status: 'active')
        segundo_carrier_management = CarrierManagement.create(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A2', 
                                                    domain_of_emails: '@oi.com.it', billing_address: 'Avenida do Faturamento, 100', 
                                                    cnpj: '32680630000140', status: 'active')
        #Act
        teste_uniquess=segundo_carrier_management.valid?
        #Assert
        expect(teste_uniquess).to eq false
    end
    it 'com razão social já cadastrada' do
        #Arrange
        admin=Admin.create!(name: 'David', email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
                                                cnpj: '76535764000143', status: 'active')
        segundo_carrier_management = CarrierManagement.create(fancy_name: 'Oi1', social_reason: 'Brasil Telecom S/A', 
                                                    domain_of_emails: '@oi.com.it', billing_address: 'Avenida do Faturamento, 100', 
                                                    cnpj: '32680630000140', status: 'active')
        #Act
        teste_uniquess=segundo_carrier_management.valid?
        #Assert
        expect(teste_uniquess).to eq false
    end
    it 'com domínio de email já cadastrado' do
        #Arrange
        admin=Admin.create!(name: 'David', email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
                                                domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
                                                cnpj: '76535764000143', status: 'active')
        segundo_carrier_management = CarrierManagement.create(fancy_name: 'Oi1', social_reason: 'Brasil Telecom S/A2', 
                                                    domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 100', 
                                                    cnpj: '32680630000140', status: 'active')
        #Act
        teste_uniquess=segundo_carrier_management.valid?
        #Assert
        expect(teste_uniquess).to eq false
    end
end