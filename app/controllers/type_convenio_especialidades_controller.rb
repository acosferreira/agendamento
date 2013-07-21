class TypeConvenioEspecialidadesController < ApplicationController
  active_scaffold :type_convenio_especialidades do |config|
    config.columns=[:type_convenio, :especialidade]
    config.columns[:type_convenio].form_ui =:select
    config.columns[:especialidade].form_ui =:select
  end
end
