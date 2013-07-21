class ConveniosController < ApplicationController
  active_scaffold :convenios do |config|
    config.columns=[:name, :telephone, :site]

    config.nested.add_link("Tipos Convenios", :type_convenios)
  end
end
