class Produto < ActiveRecord::Base
  belongs_to :fornecedor
  has_many :estoques

  
end