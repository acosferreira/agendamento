class AddMenuItem < ActiveRecord::Migration
  def self.up
    Menu.create(:name=>"Estabelecimento", :url=>"#", :order=>1)
    Menu.create(:name=>"Profissional", :url=>"#", :order=>1)
    Menu.create(:name=>"Cliente", :url=>"#", :order=>1)
    Menu.create(:name=>"Configuração", :url=>"#", :order=>1)

    cadastro = Menu.find_by_name("Estabelecimento")
    Menu.create(:name=>"Estabelecimento", :url=>"/estabelecimentos", :order=>1, :menu_id=>cadastro.id)
    Menu.create(:name=>"Horario", :url=>"/horarios", :order=>2, :menu_id=>cadastro.id)
    Menu.create(:name=>"Semana", :url=>"/semanas", :order=>3, :menu_id=>cadastro.id)
    Menu.create(:name=>"Convenio", :url=>"/convenios", :order=>4, :menu_id=>cadastro.id)
    Menu.create(:name=>"Agenda", :url=>"/agendas", :order=>5, :menu_id=>cadastro.id)

    cadastro = Menu.find_by_name("Profissional")
    Menu.create(:name=>"Profissional", :url=>"/profissionals", :order=>1, :menu_id=>cadastro.id)
    Menu.create(:name=>"Especialidade", :url=>"/profissional_especialidades", :order=>2, :menu_id=>cadastro.id)
    
    cadastro = Menu.find_by_name("Cliente")
    Menu.create(:name=>"Cliente", :url=>"/clientes", :order=>1, :menu_id=>cadastro.id)
    Menu.create(:name=>"Historico", :url=>"/historicos", :order=>2, :menu_id=>cadastro.id)
    
    cadastro = Menu.find_by_name("Configuração")
    Menu.create(:name=>"Usuário", :url=>"/usuarios", :order=>1, :menu_id=>cadastro.id)
    Menu.create(:name=>"Permissão", :url=>"/permissaos", :order=>2, :menu_id=>cadastro.id)
    Menu.create(:name=>"Grupos de Acesso", :url=>"/grupos", :order=>3, :menu_id=>cadastro.id)
    Menu.create(:name=>"Menu", :url=>"/menus", :order=>4, :menu_id=>cadastro.id)
    Menu.create(:name=>"Convenio", :url=>"/type_convenios", :order=>5, :menu_id=>cadastro.id)
    Menu.create(:name=>"Especialidade", :url=>"/especialidades", :order=>6, :menu_id=>cadastro.id)



  end

  def self.down
    execute("truncate table menus")
  end
end
