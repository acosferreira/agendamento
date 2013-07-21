class EstabelecimentosController < ApplicationController
  active_scaffold :estabelecimentos do |config|
    config.columns=[:name, :address, :number, :complement, :neighborhood, :city, :uf, :inicio, :fim]
    
    config.nested.add_link("Profissionais", :estabelecimento_profissionals)
    
    config.nested.add_link("Contatos", :contatos)

    config.columns[:inicio].description = "HH:MM"
    config.columns[:fim].description = "HH:MM"

    
  end
end
