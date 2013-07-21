class EstoquesController < ApplicationController
  active_scaffold :estoques do |config|
    config.columns=[:produto, :qtd,:data_entrada ]
    config.columns[:produto].form_ui= :select
    
  end
  end