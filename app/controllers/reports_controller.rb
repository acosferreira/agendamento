class ReportsController < ApplicationController

  layout "application", :except => [:agenda_profissional_diaria, :valor_pagar_profissional]

  def index
    @action_url = generate_url_by_layout_param
  end

  def especialidades(profissional_id)
    Report.especialidades(profissional_id)
  end
  def agenda_profissional_diaria
    @agendas = Agenda.find(:all, :conditions=>["profissional_especialidade_id in (?) and data = ?",especialidades(params[:profissional_id]), params[:data].to_date ])
  end
  

  def agenda_profissional_diaria_to_xls
    puts '$%'*50
    puts params[:profissional_id]
    puts "#{params[:data].to_date}"
    send_file Report.agenda_profissional_diaria_to_xls(params[:profissional_id], params[:data].to_date)
  end

  def valor_pagar_profissional
     p = Profissional.find(params[:profissional_id])
      @servicos= p.get_value_to_receive(params[:data].to_date)
  end


  def valor_pagar_profissional_to_xls
    puts '$%'*50
    puts params[:profissional_id]
    puts "#{params[:data].to_date}"
    send_file Report.valor_pagar_profissional_to_xls(params[:profissional_id], params[:data].to_date)
  end

  private

  def generate_url_by_layout_param
    
    send("#{params[:layout]}_reports_url") if params[:layout]
  end

  def validate_param_layout
    render(:file => "#{RAILS_ROOT}/public/404.html",  :status => 404) if is_param_layout_invalid?
  end

  def is_param_layout_invalid?
    send("#{params[:layout]}_report_xls_url")
    params[:layout].blank?
  rescue NoMethodError
    true
  end
end