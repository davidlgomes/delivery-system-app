require 'rails_helper'

describe 'Usuário se autentica' do
    it 'com sucesso' do
        usuario=User.create!(email:'gomes.david.912@gmail.com', password:'12t&$Te054')
        login(usuario)
       within('nav') do
            expect(page).not_to have_link 'Entrar' 
            expect(page).to have_button 'Sair'
            expect(page).to have_content 'gomes.david.912@gmail.com'
       end
       expect(page).to have_content 'Login efetuado com sucesso.'
    end
    it 'e faz logout' do
        usuario=User.create!(email:'gomes.david.912@gmail.com', password:'12t&$Te054')
        login(usuario)
        click_on 'Sair'
        within('nav') do
            expect(page).to have_link 'Entrar' 
            expect(page).not_to have_button 'Sair'
            expect(page).not_to have_content 'gomes.david.92@gmail.com'
       end
       expect(page).to have_content 'Logout efetuado com sucesso.'
    end

end