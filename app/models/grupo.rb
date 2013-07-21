class Grupo < ActiveRecord::Base
  has_many :usuarios
  has_many :permissao
end
