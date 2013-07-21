class Fornecedor < ActiveRecord::Base
  has_many :produtos
end
