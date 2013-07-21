class EspecialidadesController < ApplicationController
  active_scaffold :especialidade do |config|
    config.columns=[:name,   :value, :duration, :percentage]
  end
end
