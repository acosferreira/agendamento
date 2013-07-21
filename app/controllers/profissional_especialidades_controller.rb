class ProfissionalEspecialidadesController < ApplicationController
  active_scaffold :profissional_especialidades do |config|
    config.columns=[:profissional, :especialidade]
    config.columns[:profissional].form_ui = :select
    config.columns[:especialidade].form_ui = :select
    
    config.nested.add_link("Dia de Atendimento", :dia_trabalhos)
    config.nested.add_link("Agenda", :agendas)

  end
end
