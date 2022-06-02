require 'rails_helper'

describe 'Administrador se autentica' do
    it 'com sucesso' do
        visit root_path
        click_on 'Entrar como Administrador'
        click_on 'Criar uma conta'
        fill_in 'Nome', with:'David'
        fill_in 'E-mail', with:'gomes.david.9@sistemadefrete.com.br'
        fill_in 'Senha', with: '12t&$Te054'
        fill_in 'Confirme sua senha', with: '12t&$Te054'
        click_on 'Criar conta'
        within('nav') do
            expect(page).not_to have_link 'Entrar' 
            expect(page).to have_button 'Sair'
            expect(page).to have_content 'gomes.david.9@sistemadefrete.com.br'
       end
       expect(page).to have_content 'Boas Vindas! Você realizou seu registro com sucesso.'
       expect(page).not_to have_link 'Olá David' 
       admin=Admin.last
       expect(admin.name).to eq('David')
    end
    it 'com e-mail fora do domínio correto' do
        visit root_path
        click_on 'Entrar como Administrador'
        click_on 'Criar uma conta'
        fill_in 'Nome', with:'David'
        fill_in 'E-mail', with:'gomes.david.9@gmail.com'
        fill_in 'Senha', with: '12t&$Te054'
        fill_in 'Confirme sua senha', with: '12t&$Te054'
        click_on 'Criar conta'
       expect(page).to have_content 'Email deve possuir o domínio de @sistemadefrete.com.br'
       expect(page).to have_field 'E-mail'
       expect(page).to have_field 'Senha' 
    end
end