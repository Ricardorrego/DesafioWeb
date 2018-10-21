page_consulta = Consulta.new

Dado("que eu esteja na home page de consulta") do
  page_consulta.load
end

Quando("eu realizar uma consulta de passagem aerea") do
  page_consulta.menu_voo
  page_consulta.consulta_passagem
end

Entao("validar que a pesquisa foi realizada com sucesso") do
  wait_for_ajax
  @result= page_consulta.table_values
  expect(@result).to be_truthy
  p "Validado com Sucesso!"
end