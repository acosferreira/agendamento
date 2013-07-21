class DiaTrabalho < ActiveRecord::Base
  belongs_to :semana
  belongs_to :profissional_especialidade
  belongs_to :estabelecimento_profissional


end
