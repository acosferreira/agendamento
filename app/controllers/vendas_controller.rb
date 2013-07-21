class VendasController < ApplicationController
  before_filter :get_total_of_venda, :only=>[:create]
  active_scaffold :vendas do |config|
    config.list.columns=[:produto, :profissional, :qtd, :valor, :created_at ]
    config.columns=[:produto, :profissional, :qtd]
    config.columns[:produto].form_ui = :select
    config.columns[:profissional].form_ui = :select
  end

  private
  def get_total_of_venda
    estoque = Estoque.find(:first, :conditions=> ["produto_id = #{params[:record][:produto]}"])

    if params[:record][:qtd].to_i <= estoque.qtd
      estoque.update_attributes!(:qtd=>estoque.qtd - (params[:record][:qtd]).to_i)
    else
      flash[:warning] = "Não é possivel vender esta quantidade, somente #{estoque.qtd}"
    end
  end
  
  def valor
    valor_produto = Produto.find(params[:record][:produto])
    valor_total = (valor_produto.valor_venda).to_f * (params[:record][:qtd]).to_i
    valor_total
  end

  protected
  def before_create_save(record)
    record.valor = valor
  end

end