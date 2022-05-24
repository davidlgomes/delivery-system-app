require 'rails_helper'

describe 'Usuário vê detalhes de um galpão' do 
    it 'e vê informações adicionais' do
        #Arrange 
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
        primeiro_carrier_management = CarrierManagement.create!(fancy_name: 'Oi', social_reason: 'Brasil Telecom S/A', 
            domain_of_emails: '@oi.com.br', billing_address: 'Avenida do Faturamento, 1000', 
            cnpj: '76535764000143', status: 'active')
        #Act
            visit(root_path)
            click_on('Oi')
            click_on('Voltar')

        #Assert
            expect(current_path).to eq(root_path)
    end
end