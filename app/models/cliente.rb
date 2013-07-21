class Cliente < ActiveRecord::Base
  has_many :contatos
  has_many :agendas
  has_many :historicos

  belongs_to :type_convenio
end
