require 'date'

class Consulta < SitePrism::Page

  set_url '/'
  element :voo_elem, 'a[href="https://www.phptravels.net/flights"]'
  element :search, 'div.search_head button[type="submit"]'
  elements :table, 'table tbody tr td small'
  @@input_select_elem = '#select2-drop > div > input[type="text"]'

  def initialize
    @data = nil
    @mes = nil
  end

  def menu_voo
    voo_elem.click
  end

  def consulta_passagem
    @mes = Date.today.strftime("%m").to_i + 3
    [1,2,7,12].each{|m|
      if @mes == m and @mes != 12
        @mes += 1
      elsif @mes >= 12
        @mes = 3
      end
    }
    p @data = "2019-#{@mes}-" + rand(1..29).to_s
    first('span', :text => /Enter City Or Airport/).click
    field01 = all(@@input_select_elem, visible: true)[0]
    field01.send_keys 'Miami Air'
    field01.send_keys :enter if sleep 3

    first('span', :text => /Enter City Or Airport/).click
    field02 = all(@@input_select_elem, visible: true)[0]
    field02.send_keys 'Miami Air'
    field02.send_keys :enter if sleep 3

    field03 = first('input[name="departure"]')
    field03.click
    field03.send_keys @data
    search.click
  end

  def table_values
    @result = false
    table_values = table.map(&:text)
    table_values.each{ |element|
      p element, element.to_s.include?(@data)
      @result = true if element.to_s.include?(@data)
    }
    return @result
  end

end