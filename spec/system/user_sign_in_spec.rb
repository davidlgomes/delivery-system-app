require 'rails_helper'

describe 'Usuário se autentica' do
    it 'com sucesso' do
        User.create!(email:'gomes.david.91@gmail.com', password:'12t&$Te054')
        visit(root_path)
        click_on 'Entrar'
        within('form') do
            fill_in 'E-mail', with:'gomes.david.91@gmail.com'
            fill_in 'Senha', with: '12t&$Te054'
            click_on 'Entrar'
        end
       within('nav') do
            expect(page).not_to have_link 'Entrar' 
            expect(page).to have_button 'Sair'
            expect(page).to have_content 'gomes.david.91@gmail.com'
       end
       expect(page).to have_content 'Login efetuado com sucesso.'
    end
    it 'e faz logout' do
        User.create!(email:'gomes.david.92@gmail.com', password:'14t&$Te054')

        visit(root_path)
        click_on 'Entrar'
        
        within('form') do
            fill_in 'E-mail', with:'gomes.david.92@gmail.com'
            fill_in 'Senha', with: '14t&$Te054'
            click_on 'Entrar'
        end
        click_on 'Sair'
        within('nav') do
            expect(page).to have_link 'Entrar' 
            expect(page).not_to have_button 'Sair'
            expect(page).not_to have_content 'gomes.david.92@gmail.com'
       end
       expect(page).to have_content 'Logout efetuado com sucesso.'
    end

end