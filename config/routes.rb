ActionController::Routing::Routes.draw do |map|
  map.resources :usuarios
  map.resources :permissaos
  map.resources :grupos
  map.resources :menus
  map.resources :newsletters
  map.resources :estoques
  map.resources :vendas
  map.resources :produtos
  
  map.resources :fornecedors

  map.resources :reports, :collection => {
    :agenda_profissional_diaria     => [:post, :get],
    :agenda_profissional_mensal    => [:post, :get],
    :agenda_profissional_periodo   => [:post, :get],
    :valor_pagar_profissional      => [:post, :get],
    :agenda_profissional_diaria_to_xls    => :get,
    :agenda_profissional_mensal_to_xls    => :get,
    :agenda_profissional_periodo_to_xls   => :get,
    :valor_pagar_profissional_to_xls      => :get
  }



  map.resources :agendas, :collection=>{:agendamento=> :get, :agendar=>:get, :reagendar=>:get, :reagendamento=>:get,
    :auto_complete_for_cliente_name => :get,
    :salvar=>:post}
  map.resources :estabelecimento_profissionals
  map.resources :dia_trabalhos
  map.resources :semanas
  map.resources :horarios
  map.resources :historicos
  map.resources :profissional_especialidades
  map.resources :type_convenio_especialidades
  map.resources :type_convenios
  map.resources :contatos
  map.resources :convenios
  map.resources :especialidades
  map.resources :profissionals
  map.resources :clientes,   :collection => {
    :auto_complete_for_cliente_name => :get
  }
  map.resources :estabelecimentos

  map.login '/admin/login', :controller => 'admin', :action => 'login'
  map.logout '/admin/logout', :controller => 'admin', :action => 'logout'
  map.root :controller => "home"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
