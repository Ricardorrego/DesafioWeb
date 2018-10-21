# language: pt

Funcionalidade: Consulta de passagem aerea

  -Eu como passageiro quero realizar uma consulta de passagem aerea

  Contexto:
    #Dado que eu esteja logado no sistema de compra de passagem.

  @consulta_de_passagem
  Cenario: Consulta de passagem aerea
    Dado que eu esteja na home page de consulta
    Quando eu realizar uma consulta de passagem aerea
    Entao validar que a pesquisa foi realizada com sucesso
