require 'rails_helper'

describe 'Usuario vê Preços de uma transportadora' do
    it 'a partir do menu' do
        admin=Admin.create!(name:'David',email:'gomes@sistemadefrete.com.br', password:'12t&$Te054')
        login_adm(admin)
        visit root_path
        click_on 'Prazos'
        expect(current_path).to eq(deadlines_path)
    end
    
end