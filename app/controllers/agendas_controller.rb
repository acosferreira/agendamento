class AgendasController < ApplicationController
  layout "application", :except => [:agendamento_por_especialidade, :agendar,:load_agenda, :salvar, :cancelar, :reagendar, :reagendamento, :voltar]

  before_filter :format_horario, :only=>[:create, :update]

  auto_complete_for :cliente, :name
  

  active_scaffold :agendas do |config|
    config.columns=[ :data,:horario, :cliente, :profissional_especialidade,  :usuario]
    config.columns[:cliente].form_ui= :select
    config.columns[:profissional_especialidade].form_ui= :select
    config.columns[:horario].description = 'HH:MM'
    config.columns[:usuario].form_ui= :select
  end

  def agendar; end

  def reagendar; end

  def voltar
    load_agenda
    render :action=> 'agendamento_por_especialidade'
  end

  def reagendamento
    
    novo_horario = params[:novo_horario].gsub(":",'')
    horario = params[:horario].rjust(4,"0")
    profisssional = get_profissional_especialidade
    agendamento = Agenda.find(:first, :conditions=>["data = ? and profissional_especialidade_id in (?) and horario= ?", session['data'], profisssional, horario])
    agendamento.update_attributes!(:horario=>novo_horario)
    load_agenda
    render :action=> 'agendamento_por_especialidade'
  end

  def cancelar
    profissional_especialidade_id = get_profissional_especialidade
    horario = params[:horario].rjust(4,"0")
    Agenda.delete_all(:horario=>horario, :profissional_especialidade_id=>profissional_especialidade_id)
    load_agenda
    render :action=> 'agendamento_por_especialidade'
  end

  def salvar
   
    horario = params[:horario].rjust(4,"0")
    cliente = Cliente.find_by_name(params[:cliente])
    profissional_especialidade_id = get_profissional_especialidade
   
    unless cliente.blank?
      unless cliente.type_convenio_id == params[:convenio]
        puts '%'*80
        puts params[:convenio]
        cliente.update_attributes!(:type_convenio_id=> params[:convenio])
      end
      create_agendamento(cliente.id, profissional_especialidade_id, horario)
      load_agenda
    else
      c = Cliente.create!(:name=> params[:cliente], :type_convenio_id => params[:convenio])
      create_agendamento(c.id, profissional_especialidade_id, horario)
      load_agenda
    end
    render :action=> 'agendamento_por_especialidade'
  end

  def agendamento
    @especialidades = Especialidade.find(:all)
  end

  def agendamento_por_especialidade
    if params[:data].blank? || params[:especialidade].blank?
      flash[:warning]= "Escolha os parâmetros"
    else
      session['data']=params[:data].to_date
      session['especialidade']= params[:especialidade]
      load_agenda
    end
  end

  def load_especialidade_of_estabelecimento
    session['estabelecimento']= params[:estab]
    @especialidades =ProfissionalEspecialidade.find(:all, :select=> "distinct especialidade_id", :conditions=>['profissional_id in (?)', [1,2,3]])

    session['especialidade_of_estabelecimento'] = @especialidades
    render :noting=> true
    get_dia_of_especialidade
  end

  def get_dia_of_especialidade
    especialidade = params[:especialidade_selected]

    profissionais = ProfissionalEspecialidade.find(:all, :conditions=>["especialidade_id = ?", especialidade])
    dias_atentimento= []
    profissionais.each do |profissional|
      dias_atentimento << Agenda.get_day_of_work(profissional.id)
    end
    @weekday = []
    dias_atentimento.each do |dia|
      dia.each do |d|
        puts d.semana.number_of_weekday
        @weekday << d.semana.number_of_weekday
      end
    end
    @weekday
  end

  private
  def get_profissional_of_estabelecimento
    profissional=[]
    profissionais = EstabelecimentoProfissional.find(:all, :conditions=>["estabelecimento_id=?", session['estabelecimento']])
    profissionais.each do |p|
      profissional<<p.profissional_id
    end

    profissional
  end

  def get_profissional
    especialidades = []
    session['especialidade_of_estabelecimento'].each do |especialidade|
      especialidades<< especialidade.especialidade_id
    end
    ProfissionalEspecialidade.find(:all, :conditions=>['especialidade_id in (?)',especialidades])
  end

  def get_profissional_especialidade
    puts "profissional=> #{params[:profissional]}"
    ProfissionalEspecialidade.find(:first, :conditions=>['especialidade_id = ? and profissional_id=?',session['especialidade'], params[:profissional] ]).id
  end

  def create_agendamento(cliente, profissional_especialidade_id, horario)

    e= ProfissionalEspecialidade.find(profissional_especialidade_id).especialidade_id
    a = Agenda.get_value_to_receive_by_client(e, cliente)
    Agenda.create!(:cliente_id => cliente, :profissional_especialidade_id => profissional_especialidade_id,
      :data => session['data'], :horario => horario, :value_receive=> a, :usuario_id=>session[:user_id])
  end

  def load_agenda
    estabelecimento_profissionals = EstabelecimentoProfissional.find(:all, :conditions=>["estabelecimento_id = #{session['estabelecimento']}"])
    profissional =[]
    estabelecimento_profissionals.each do |estabelecimento_profissional|
      profissional << estabelecimento_profissional.profissional_id
    end
    number_day = session['data'].strftime("%w")
    #@profissionals = ProfissionalEspecialidade.find(:all, :conditions=>['especialidade_id=? and profissional_id in (?)', session['especialidade'], profissional])
    @profissionals = ProfissionalEspecialidade.find(:all, :joins=> {:dia_trabalhos => :semana}, :conditions=>['especialidade_id=? and profissional_id in (?) and number_of_weekday = ?', session['especialidade'],profissional,number_day])
    @agendas = get_agenda_full_of_profissional(@profissionals)
    @agenda = Agenda.find(:all, :conditions=>["data = ? and profissional_especialidade_id in (?)", session['data'], profissional])
    @estabelecimentos = Estabelecimento.find(session['estabelecimento'])
    horarios = get_horarios_to_atendimento(@estabelecimentos, session['especialidade'])

    get_agendamento(@agendas, horarios)
  end

  def get_horarios_to_atendimento(estabelecimentos, especialidades)
    @horarios=[]
    especialidade = Especialidade.find(especialidades)
    duracao = especialidade.duration.to_i
    inicio = Time.parse(estabelecimentos.inicio)
    fim = Time.parse(estabelecimentos.fim)
    while inicio<= fim do
      @horarios<< inicio.strftime("%H:%M") 
      inicio = inicio + duracao * 60
    end
    @horarios
  end

  def get_agendamento(agendas, horarios)
    @lista_atendimento=[]
    horarios.each_with_index do |hora, i|
      agendas.each do |agenda|
        i+1 < horarios.size ? proximo = horarios[i+1] : proximo = horarios[i]
        unless agenda[:horario].blank?
          if agenda[:horario] >= horarios[i] && agenda[:horario] <= proximo
            @lista_atendimento << {:horario=> agenda[:horario], :cliente=>agenda[:cliente], :profissional=>agenda[:profissional]}
          else
            @lista_atendimento << {:horario=> horarios[i], :cliente=>nil, :profissional=>agenda[:profissional]}
          end
        else
          @lista_atendimento << {:horario=> horarios[i], :cliente=>nil, :profissional=>agenda[:profissional]}
        end
      end
    end
    @lista_atendimento = @lista_atendimento.sort_by { |h| [h[:horario], h[:profissional]] }
    ###########
    agendas.each do |agenda|
      @lista_atendimento.each do |lista|
        #unless agenda[:cliente].blank?
        if agenda[:horario] == lista[:horario] && agenda[:profissional] == lista[:profissional] #&& agenda[:cliente].blank?
          if lista[:cliente].blank?
            @lista_atendimento.reject!{|l| l==lista}
          end
        end
      end
    end
    ##########
    @lista_atendimento.uniq!
  end

  def get_agenda_full_of_profissional(profissionals)
    puts "#{profissionals}"
    puts "#{session['data']}"
    @full = Agenda.agenda_full_of_profissional(profissionals, session['data'])
    #    @full =[]
    #    profissionals.each do |profissional|
    #      p = ProfissionalEspecialidade.find(:all, :conditions=>['profissional_id=?',profissional.profissional.id ])
    #      p.each do |ab|
    #        @agenda_full =Agenda.find(:all, :conditions=>["data = ? and profissional_especialidade_id= ?", session['data'], ab.id])
    #        unless @agenda_full.blank?
    #          @agenda_full.each_with_index do |agenda, i|
    #            b = @agenda_full[i].horario[0..1]+":"+@agenda_full[i].horario[2..3]
    #            @full << {:horario=> b ,:cliente=>@agenda_full[i].cliente.name, :especialidade=>ab.id, :profissional=>profissional.profissional.id}
    #          end
    #        else
    #          @full << {:horario=> nil ,:cliente=>nil, :especialidade=>ab.id, :profissional=>profissional.profissional.id}
    #        end
    #      end
    #    end
    #    @full
  end
  
  def get_value_to_receive
    Agenda.get_value_to_receive_by_client(params[:record][:profissional_especialidade], params[:record][:cliente])
  end

  def format_horario
    params[:record][:horario] =params[:record][:horario].gsub(":",'')
  end
end
