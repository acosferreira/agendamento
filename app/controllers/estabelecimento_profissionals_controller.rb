class EstabelecimentoProfissionalsController < ApplicationController
  active_scaffold :estabelecimento_profissionals do |config|
    config.columns=[:profissional, :estabelecimento]
    config.columns[:profissional].form_ui=:select
    config.columns[:estabelecimento].form_ui=:select

   # config.nested.add_link("Especialidades", :profissional_especialidades)
  end
end
