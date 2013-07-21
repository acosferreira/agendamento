class HistoricosController < ApplicationController
  active_scaffold :historicos do |config|
    config.columns=[:name]
  end
end
