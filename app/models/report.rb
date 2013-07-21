class Report
  require 'rubygems'
  require 'roo'

  class << self


    def profissional(profissional_id)
      Profissional.find(profissional_id).name
    end

    def especialidades (profissional_id)
      ProfissionalEspecialidade.find(:all, :conditions=>["profissional_id=?",profissional_id])
    end

    def agenda_profissional_diaria_to_xls(profissional_id, dia)
      puts '$%'*50
      puts profissional_id
      puts dia
      FileUtils.mkdir_p("#{RAILS_ROOT}/public/reports")
      filename = Rails.root.join("#{RAILS_ROOT}/public/reports/agenda_profissional_diaria_#{Time.now.strftime('%Y%m%d%H%M%S')}.xls").to_s
      sheet = file.create_worksheet(:name => "Agenda Diaria")
      line = 0

      agendas = Agenda.find(:all, :conditions=>["profissional_especialidade_id in (?) and data = ?",especialidades(profissional_id), dia ])
      
      cols = ["#{profissional(profissional_id)} - Agenda dia #{dia} "]

      sheet.row(line).replace(cols)
      line += 1
      cols = ["Horario", "Cliente", "Serviço", "Valor do Serviço", "Agendado por"]

      sheet.row(line).replace(cols)
      line += 1
      agendas.each do|agenda|
        if agenda.usuario_id.blank?
          usuario=''
        else
          usuario = agenda.usuario.name
        end
        cols = [agenda.horario, agenda.cliente.name, agenda.profissional_especialidade.especialidade.name, agenda.value_receive, usuario]
        sheet.row(line).replace(cols)
        line += 1
      end

      write(filename)
      filename

    end

    def agenda_profissional_mensal_to_xls(profissional_id,mes)

      FileUtils.mkdir_p("#{RAILS_ROOT}/public/reports")
      filename = Rails.root.join("#{RAILS_ROOT}/public/reports/agenda_profissional_mensal_#{Time.now.strftime('%Y%m%d%H%M%S')}.xls").to_s
      sheet = file.create_worksheet(:name => "Agenda Mensal")
      line = 0

      agendas = Agenda.find(:all, :conditions=>["profissional_especialidade_id in (?) and Month(data) = ?",especialidades(profissional_id), mes ], :order=>:data)

      cols = ["#{profissional(profissional_id)} - Agenda Mes #{mes} "]

      sheet.row(line).replace(cols)
      line += 1
      cols = ["Data","Horario", "Cliente", "Valor do Serviço", "Agendado por"]

      sheet.row(line).replace(cols)
      line += 1
      agendas.each do|agenda|
        if agenda.usuario_id.blank?
          usuario=''
        else
          usuario = agenda.usuario.name
        end
        cols = [agenda.data, agenda.horario, agenda.cliente.name, agenda.value_receive, usuario]
        sheet.row(line).replace(cols)
        line += 1
      end

      write(filename)
      filename
    end

    def agenda_profissional_periodo_to_xls(profissional_id, inicio, fim)

      FileUtils.mkdir_p("#{RAILS_ROOT}/public/reports")
      filename = Rails.root.join("#{RAILS_ROOT}/public/reports/agenda_profissional_periodo_#{Time.now.strftime('%Y%m%d%H%M%S')}.xls").to_s
      sheet = file.create_worksheet(:name => "Agenda por Periodo")
      line = 0

      agendas = Agenda.find(:all, :conditions=>["profissional_especialidade_id in (?) and data between ? and ? ",especialidades(profissional_id), inicio, fim ], :order=>:data)

      cols = ["#{profissional(profissional_id)} - Agenda Periodo #{inicio} - #{fim}"]

      sheet.row(line).replace(cols)
      line += 1
      cols = ["Data","Horario", "Cliente", "Valor do Serviço", "Agendado por"]

      sheet.row(line).replace(cols)
      line += 1
      agendas.each do|agenda|
        if agenda.usuario_id.blank?
          usuario=''
        else
          usuario = agenda.usuario.name
        end
        cols = [agenda.data, agenda.horario, agenda.cliente.name, agenda.value_receive, usuario]
        sheet.row(line).replace(cols)
        line += 1
      end

      write(filename)
      filename

    end

    def valor_pagar_profissional_to_xls(profissional_id, data)
      FileUtils.mkdir_p("#{RAILS_ROOT}/public/reports")
      filename = Rails.root.join("#{RAILS_ROOT}/public/reports/agenda_profissional_periodo_#{Time.now.strftime('%Y%m%d%H%M%S')}.xls").to_s
      sheet = file.create_worksheet(:name => "Agenda por Periodo")
      line = 0


      p = Profissional.find(profissional_id)
      servicos= p.get_value_to_receive(data)

      cols = ["#{profissional(profissional_id)} - Valor a receber (#{data})"]
      sheet.row(line).replace(cols)
      line += 1
      cols = ["Especialidade","Qtd Atendimento",  "Valor do Serviço", "Total"]
      sheet.row(line).replace(cols)
      line += 1
      
      servicos.each do |servico|
        especialidade = Especialidade.find(servico[:especialidade]).name
        cols = [especialidade, servico[:qtd_atendimento], servico[:valor], servico[:total_to_receive]]
        sheet.row(line).replace(cols)
        line += 1
        
      end

      write(filename)
      filename
    end

    def file
      @file ||= Spreadsheet::Workbook.new
    end

    def write(filename)
      file.write filename
    end
  end
end