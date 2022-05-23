require 'rails_helper'

describe 'Usuário Visita Tela Inicial' do 
    it 'e vê o nome do app' do
        #Arrange

        #Act
            visit(root_path)
        #Assert
            expect(page).to have_content('Sistema de Entrega')
            expect(page).not_to have_content('Erro')
    end
end