class Agenda < ActiveRecord::Base

  belongs_to :cliente
  belongs_to :profissional_especialidade
  belongs_to :usuario
  validates_uniqueness_of :horario, :scope=>[ :data, :profissional_especialidade_id,:cliente_id ]
  validates_presence_of :data
  #validates_format_of :horario, :with=>/[0-9]{2}[0-9]{2}/
  validates_length_of :horario, :is=>4

  # private


  def self.get_day_of_work(especialidade)
    DiaTrabalho.find(:all, :conditions=>["profissional_especialidade_id = ?",especialidade])
  end
  
  def self.get_value_to_receive_by_client(especialidade,client_id)
    value = Especialidade.find(especialidade).value
    Cliente.find(client_id).type_convenio.blank? ? discount=0 : discount=Cliente.find(client_id).type_convenio.coverage
    receive = 0
    unless discount==0
      if !value.blank? && value!=0 && !discount.blank?
        receive = value-(value *(discount/100))
      end
    else
      receive = value
    end
    return receive
  end

  def self.agenda_full_of_profissional(profissionals, data)
    full =[]
    profissionals.each do |profissional|
      p = ProfissionalEspecialidade.find(:all, :conditions=>['profissional_id=?',profissional.profissional.id ])
      p.each do |ab|
        agenda_full =Agenda.find(:all, :conditions=>["data = ? and profissional_especialidade_id= ?",data, ab.id])
        unless agenda_full.blank?
          agenda_full.each_with_index do |agenda, i|
            b = agenda_full[i].horario[0..1]+":"+agenda_full[i].horario[2..3]
            full << {:horario=> b ,:cliente=>agenda_full[i].cliente.name, :especialidade=>ab.id, :profissional=>profissional.profissional.id}
          end
        else
          full << {:horario=> nil ,:cliente=>nil, :especialidade=>ab.id, :profissional=>profissional.profissional.id}
        end
      end
    end
    full
  end
end
