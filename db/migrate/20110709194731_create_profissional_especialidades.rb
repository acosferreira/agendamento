class CreateProfissionalEspecialidades < ActiveRecord::Migration
  def self.up
    create_table :profissional_especialidades do |t|
      t.integer :especialidade_id
      t.integer :profissional_id

      t.timestamps
    end
  end

  def self.down
    drop_table :profissional_especialidades
  end
end
