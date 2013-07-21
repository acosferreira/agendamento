class Contato < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :estabelecimento
  belongs_to :profissional
end
