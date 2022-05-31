require 'rails_helper'

describe 'Usuario vê Preços de uma transportadora' do
    it 'a partir do menu' do
        visit root_path
        click_on 'Prazos'
        expect(current_path).to eq(deadlines_path)
    end
    
end