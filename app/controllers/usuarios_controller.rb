class UsuariosController < ApplicationController
  active_scaffold :usuarios do |config|
    config.columns = [:name, :login, :password, :grupo]
  end
end
