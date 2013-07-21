class TypeConveniosController < ApplicationController

  active_scaffold :type_convenios do |config|
    config.columns=[:name, :coverage]
    config.nested.add_link("Especialidades", :type_convenio_especialidades)
    config.columns[:coverage].description="%"
    config.subform.layout =:vertical
  end
end
