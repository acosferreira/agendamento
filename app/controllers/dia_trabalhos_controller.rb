class DiaTrabalhosController < ApplicationController
  active_scaffold :dia_trabalhos do |config|
    config.columns=[:profissional_especialidade, :semana, :estabelecimento_profissional]
    config.columns[:profissional_especialidade].form_ui = :select
    config.columns[:estabelecimento_profissional].form_ui = :select
    config.columns[:semana].form_ui = :select
  end
end
