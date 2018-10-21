# language: pt

Funcionalidade: Realizar um novo cadastro de cliente

  -Eu como admin.
  -Eu quero criar um novo cliente.

  Contexto:
    Dado que eu esteja logado no sistema.

  @criar_novo_cliente
  Cenario: Criar novo cliente.
    Dado que eu esteja na pagina de adicionar novo cliente
    Quando eu realizar o cadastro desse cliente
    Entao validar que o cadastro do cliente foi realizado com sucesso
