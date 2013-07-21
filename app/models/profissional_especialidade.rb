class ProfissionalEspecialidade < ActiveRecord::Base
  belongs_to :profissional
  belongs_to :especialidade
  has_many :dia_trabalhos
  has_many :agendas

  def to_label
   "#{profissional.name} - #{especialidade.name}"
  end
end
