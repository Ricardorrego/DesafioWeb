class Contas < SitePrism::Page

  element :menu_elem, 'a[href="#ACCOUNTS"]'
  element :submenu_elem, 'a[href*="/customers"]'
  element :botao_logar_elem, 'button[type="submit"]'
  element :nome_elem,        'input[name="fname"]'
  element :last_nome_elem,   'input[name="lname"]'
  element :email_elem,       'input[name="email"]'
  element :senha_elem,       'input[name="password"]'
  element :numero_celular_elem, 'input[name="mobile"]'
  element :pais_elem,            'input[name="email"]'
  element :endereco_primeiro_elem,     'input[name="address1"]'
  element :endereco_segundo_elem,   'input[name="address2"]'
  element :select_bt_elem, 'span[class="select2-arrow"] b'
  element :btn_enviar_elem, 'button[class="btn btn-primary"]'
  elements :table, 'table.table tbody tr td'

  # elementos invisible, variavel de classe.
  @@input_select_elem = 'input[class*="select2-input"]'
  @@select_status_elem = 'select[name="status"]'

  def initialize
    @primeiro_nome = Faker::Name.first_name
    @segundo_nome = Faker::Name.last_name
    @email = Faker::Internet.email
    @senha = Faker::Internet.password
    @mobile = Faker::PhoneNumber.phone_number
    @endereco_primeiro = Faker::Address.full_address
    @endereco_segundo = Faker::Address.full_address

  end

  def menu_contas
    menu_elem.click
  end

  def clientes
    submenu_elem.click
  end

  def adicionar
    botao_logar_elem.click
  end

  def combobox(string="Brazil")
    select_bt_elem.hover
    select_bt_elem.click
    find(@@input_select_elem, visible: false).send_keys [string], :return
  rescue => ex
    p ex
  end

  def preencher_dados
    nome_elem.set @primeiro_nome
    last_nome_elem.set @segundo_nome
    email_elem.set @email
    senha_elem.set @senha
    numero_celular_elem.set @mobile
    endereco_primeiro_elem.set @endereco_primeiro
    endereco_segundo_elem.set @endereco_segundo
    select_value(locator: @@select_status_elem, option_value: 'yes')
    btn_enviar_elem.click
  end

  def validar_array
    [@primeiro_nome, @segundo_nome, @email]
  end

  def table_values
    table.map(&:text)
  end

end