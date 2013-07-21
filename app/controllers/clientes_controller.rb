class ClientesController < ApplicationController

  auto_complete_for :cliente, :name

  active_scaffold :cliente do |config|
    config.columns=[:name, :birth_date, :gender, :type_convenio, :address, :number, :complement, :neighborhood , :city, :uf]

    config.columns[:type_convenio].form_ui =:select

    config.columns[:gender].form_ui =:select
    config.columns[:gender].options = {:options => Enum::GENDER}

    config.nested.add_link("Consulta", :agendas)
    config.nested.add_link("Contatos", :contatos)
    config.nested.add_link("Historico", :historicos)
    
    config.subform.layout =:vertical

    #config.columns[:contatos].association.reverse = :cliente
  end


end
