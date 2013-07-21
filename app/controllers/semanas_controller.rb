class SemanasController < ApplicationController
  active_scaffold :semanas do |config|
    config.columns=[:name, :number_of_weekday]
  end
end
