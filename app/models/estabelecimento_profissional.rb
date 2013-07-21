class EstabelecimentoProfissional < ActiveRecord::Base
  belongs_to :estabelecimento
  belongs_to :profissional

  def to_label
    "#{estabelecimento.name}"
  end
end
