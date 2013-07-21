class RemoveColumnFromProfissionalAddColumnInEspecialidade < ActiveRecord::Migration
  def self.up
    remove_column :profissionals, :percentage
    add_column :especialidades, :percentage, :float
  end

  def self.down
    add_column :profissional, :percentage, :float
    remove_column :especialidades, :percentage
  end
end
