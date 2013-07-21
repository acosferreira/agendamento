class TypeConvenio < ActiveRecord::Base
  belongs_to :convenio
  has_many :clientes

  validates_format_of :coverage , :with=>/[0-9]{2}/

  def to_label
  "#{convenio.name} - #{self.name}"
  end

end
