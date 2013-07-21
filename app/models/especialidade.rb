class Especialidade < ActiveRecord::Base
  has_many :profissional_especialidades
  has_many :profissionals, :through=>:profissional_especialidades
  has_many :type_convenio_especialidades

  validates_numericality_of   :percentage, :less_than =>100
  validates_presence_of :name, :value, :duration
end
