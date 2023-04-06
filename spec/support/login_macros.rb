def login(usuario)
    visit(root_path)
    click_on 'Entrar'
    within('form') do
        fill_in 'E-mail', with: usuario.email
        fill_in 'Senha', with: usuario.password
        click_on 'Entrar'
    end 
end
def login_adm(admin)
    visit(root_path)
    click_on 'Entrar como Administrador'
    fill_in 'E-mail', with: admin.email
    fill_in 'Senha', with: admin.password
    within('form') do
        click_on 'Entrar'
    end
end