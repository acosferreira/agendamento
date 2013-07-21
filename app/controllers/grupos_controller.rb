class GruposController < ApplicationController
  active_scaffold :grupos do |config|
    config.columns=[:name, :grupo]
    config.columns[:grupo].form_ui=:select
  end
end
