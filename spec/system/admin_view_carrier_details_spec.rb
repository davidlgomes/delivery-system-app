require 'rails_helper'

describe 'Usuário vê detalhes de uma transportadora' do 
    it 'se estiver autenticado' do
        #Arrange
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        #Act
        visit(root_path)
        click_on('Oi')
        #Assert
        expect(current_path).to eq new_user_session_path
    end
    it 'e vê informações adicionais' do
        #Arrange 
        usuario=User.create!(email:'gomes.david.912@gmail.com', password:'12t&$Te054')
        login_as(usuario)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        #Act
        visit(root_path)
        click_on('Oi')
        #Assert
        expect(page).to have_content('Oi')
        expect(page).to have_content('Razão Social: Brasil Telecom')
        expect(page).to have_content('Domínio de e-mail: @oi.com.br')
        expect(page).to have_content('Endereço para Faturamento: Avenida do Faturamento, 1000')
        expect(page).to have_content('CNPJ: 76535764000143')
        expect(page).to have_content('Status: active')
    end
    it 'e volta para tela inicial' do
        #Arrange
        usuario=User.create!(email:'gomes.david.912@gmail.com', password:'12t&$Te054')
        login_as(usuario)
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        #Act
            visit(root_path)
            click_on('Oi')
            click_on('Sistema de Entrega')

        #Assert
            expect(current_path).to eq(root_path)
    end
end