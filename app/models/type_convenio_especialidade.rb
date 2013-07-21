class TypeConvenioEspecialidade < ActiveRecord::Base
  belongs_to :type_convenio
  belongs_to :especialidade
end
