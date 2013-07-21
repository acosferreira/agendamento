class ProdutosController < ApplicationController
  active_scaffold :produtos do |config|
    config.columns=[:name, :description, :marca, :fornecedor, :valor_unitario, :valor_venda ]
    config.columns[:fornecedor].form_ui = :select
  end
  end