require 'rails_helper'

describe 'Usuario vê Preços de uma transportadora' do
    it 'a partir do menu' do
        usuario=User.create!(email:'gomes.david.912@gmail.com', password:'12t&$Te054')
        login_as(usuario)
        visit root_path
        click_on 'Preços'
        expect(current_path).to eq(delivery_prices_path)
    end
    
end