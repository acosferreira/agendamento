class CreateTypeConvenioEspecialidades < ActiveRecord::Migration
  def self.up
    create_table :type_convenio_especialidades do |t|
      t.integer :type_convenio_id
      t.integer :especialidade_id

      t.timestamps
    end
  end

  def self.down
    drop_table :type_convenio_especialidades
  end
end
