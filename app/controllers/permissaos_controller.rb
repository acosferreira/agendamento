class PermissaosController < ApplicationController
active_scaffold :permissaos do |config|
  config.columns=[:menu, :grupo, :view, :add, :change, :erase]
  config.columns[:menu].form_ui = :select
  config.columns[:grupo].form_ui = :select
  config.columns[:view].form_ui = :checkbox
  config.columns[:add].form_ui = :checkbox
  config.columns[:change].form_ui = :checkbox
  config.columns[:erase].form_ui = :checkbox
end
end
