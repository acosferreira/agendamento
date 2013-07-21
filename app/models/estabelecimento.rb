class Estabelecimento < ActiveRecord::Base
  has_many :contatos
  has_many :estabelecimento_profissionals

  has_many :profissionals, :through=>:estabelecimento_profissionals

  validates_presence_of :inicio, :fim, :name
  validates_format_of :inicio , :with=>/[0-9]{2}:[0-9]{2}/
  validates_format_of :fim , :with=>/[0-9]{2}:[0-9]{2}/

  
end
