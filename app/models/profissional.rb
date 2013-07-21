class Profissional < ActiveRecord::Base
  has_many :contatos
  has_many :profissional_especialidades
  has_many :especialidades, :through=>:profissional_especialidades
  has_many :estabelecimento_profissionals
  has_many :estabelecimentos, :through=>:estabelecimento_profissionals

  validates_presence_of :name

  def get_agenda(data)
    full=[]
    p = ProfissionalEspecialidade.find(:all, :conditions=>['profissional_id=?',self.id ])
    p.each do |ab|
      agenda_full =Agenda.find(:all, :conditions=>["data = ? and profissional_especialidade_id= ?",data, ab.id])
      unless agenda_full.blank?
        agenda_full.each_with_index do |agenda, i|
          b = agenda_full[i].horario[0..1]+":"+agenda_full[i].horario[2..3]
          full << {:horario=> b ,:cliente=>agenda_full[i].cliente.name, :especialidade=>ab.id, :profissional=>self.id}
        end
      end
    end
    full
  end

  def get_value_to_receive(data)
    total = []
    agendas=get_agenda(data)
    agendas.each do |a|
      value_of_especialidades =   Especialidade.find(a[:especialidade])
      qtd = agendas.count{|x| x[:especialidade] ==(a[:especialidade])}
      q = total.count{|x| x[:especialidade]== a[:especialidade]}
      if q==0
         value_of_especialidades.value.blank? ? value = 0 : value = value_of_especialidades.value
         value_of_especialidades.percentage.blank? ? percentage = 0 : percentage = value_of_especialidades.percentage

        puts "$#"*50
        puts value
        puts qtd
        puts percentage

        total << {:especialidade => a[:especialidade], :qtd_atendimento=>qtd, :valor=> value, :total_to_receive=> ((value * qtd)* (percentage / 100))}
      end
    end
    total
  end
end
