require 'rails_helper'

describe 'Administrador se autentica' do
    it 'com sucesso' do
       admin=Admin.create!(name: 'David', email:'gomes.david.912@sistemadefrete.com.br', password:'12t&$Te054')
       login_adm(admin)
       within('nav') do
            expect(page).not_to have_link 'Entrar como Administrador' 
            expect(page).to have_button 'Sair'
            expect(page).to have_content 'gomes.david.912@sistemadefrete.com.br'
       end
       expect(page).to have_content 'Login efetuado com sucesso.'
    end
    it 'e faz logout' do
        admin=Admin.create!(name: 'David', email:'gomes.david.912@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        click_on 'Sair'
        within('nav') do
            expect(page).to have_link 'Entrar como Administrador' 
            expect(page).not_to have_button 'Sair'
            expect(page).not_to have_content 'gomes.david.912@sistemadefrete.com.br'
       end
       expect(page).to have_content 'Logout efetuado com sucesso.'
    end

end