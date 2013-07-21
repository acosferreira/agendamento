class FornecedorsController < ApplicationController
  active_scaffold :fornecedors do |config|
    config.columns=[:name, :empresa, :contato]

  end
  end