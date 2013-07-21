class ContatosController < ApplicationController
  active_scaffold :contatos do |config|
    config.columns=[:name, :tipo_contato]
    config.columns[:tipo_contato].form_ui =:select
    config.columns[:tipo_contato].options = {:options => Enum::CONTATO}

    config.subform.layout =:vertical
  end
end
