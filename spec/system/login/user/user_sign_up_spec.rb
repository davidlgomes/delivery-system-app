require 'rails_helper'

describe 'Usuário se autentica' do
    it 'com sucesso' do
        visit root_path
        click_on 'Entrar'
        click_on 'Criar uma conta'
        fill_in 'Nome', with:'David'
        fill_in 'E-mail', with:'gomes.david.9@gmail.com'
        fill_in 'Senha', with: '12t&$Te054'
        fill_in 'Confirme sua senha', with: '12t&$Te054'
        click_on 'Criar conta'
        within('nav') do
            expect(page).not_to have_link 'Entrar' 
            expect(page).to have_button 'Sair'
            expect(page).to have_content 'gomes.david.9@gmail.com'
       end
       expect(page).to have_content 'Boas Vindas! Você realizou seu registro com sucesso.'
       expect(page).not_to have_link 'Olá David' 
       user=User.last
       expect(user.name).to eq('David')
    end
end