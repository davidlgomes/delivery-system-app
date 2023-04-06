require 'rails_helper'
describe 'Usuário edita um Veículo' do 
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
        click_on 'Editar'
        fill_in 'Distância Mínima', with: '0' 
        fill_in 'Distância Máxima', with: '50'
        fill_in 'Dias Mínimo', with: '50' 
        fill_in 'Dias entrega', with:'100'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Prazo Editado com sucesso'  
    end
    it 'com todos os campos em branco' do
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
        click_on 'Editar'
        fill_in 'Distância Mínima', with: '' 
        fill_in 'Distância Máxima', with: ''
        fill_in 'Dias Mínimo', with: '' 
        fill_in 'Dias entrega', with:''
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Prazo' 
    end
    it 'com Distância Mínima em branco' do
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
        click_on 'Editar'
        fill_in 'Distância Mínima', with: '' 
        fill_in 'Distância Máxima', with: '50'
        fill_in 'Dias Mínimo', with: '50' 
        fill_in 'Dias entrega', with:'100'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Prazo'
    end
    it 'com Distância Máxima em branco' do
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
        click_on 'Editar'
        fill_in 'Distância Mínima', with: '0' 
        fill_in 'Distância Máxima', with: ''
        fill_in 'Dias Mínimo', with: '50' 
        fill_in 'Dias entrega', with:'100'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Prazo'
    end
    it 'com Dias Mínimo em branco' do
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
        click_on 'Editar'
        fill_in 'Distância Mínima', with: '0' 
        fill_in 'Distância Máxima', with: '50'
        fill_in 'Dias Mínimo', with: '' 
        fill_in 'Dias entrega', with:'100'
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Prazo' 
    end
    it 'com Dias Entrega em branco' do
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
        click_on 'Editar'
        fill_in 'Distância Mínima', with: '0' 
        fill_in 'Distância Máxima', with: '50'
        fill_in 'Dias Mínimo', with: '50' 
        fill_in 'Dias entrega', with:''
        select primeiro_carrier_management.fancy_name, from: 'Transportadora'
        click_on 'Enviar'
        expect(page).to have_content 'Não foi possível Editar o Prazo' 
    end
end