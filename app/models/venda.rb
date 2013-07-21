class Venda < ActiveRecord::Base
  belongs_to :produto
  belongs_to :profissional

  class << self

    def set_total_venda(valor_total)
      puts '#@'*50
      puts valor_total
      valor = valor_total
    end

  end
end
