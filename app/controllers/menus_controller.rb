class MenusController < ApplicationController
active_scaffold :menus do |config|
  config.columns=[:name, :order, :url, :menu]
  config.columns[:menu].form_ui = :select
end
end
