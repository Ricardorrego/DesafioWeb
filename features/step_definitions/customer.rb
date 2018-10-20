page_login = PageLogin.new
page_contas = Contas.new

Dado("que eu esteja logado no sistema.") do
  page_login.load
  page_login.logar_customer(LOGIN, SENHA)
end

Dado("que eu esteja na pagina de adicionar novo cliente") do
  wait_for_ajax
  page_contas.menu_contas
  page_contas.clientes
end

Quando("eu realizar o cadastro desse cliente") do
  wait_for_ajax
  page_contas.adicionar
  page_contas.combobox
  page_contas.preencher_dados
end

Entao("validar que o cadastro do cliente foi realizado com sucesso") do
  valores = page_contas.validar_array
  @table_values = page_contas.table_values
  valores.each_with_index{ |value, index|
    expect(@table_values).to include(value)
  }
  p "Validado com Sucesso!"
end

