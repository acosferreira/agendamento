class CreateAgendas < ActiveRecord::Migration
  def self.up
    create_table :agendas do |t|
      t.date :data
      t.integer :horario_id
      t.integer :cliente_id
      t.integer :profissional_especialidade_id
      t.string :type_consulta
      t.float :value
      t.float :value_receive

      t.timestamps
    end
  end

  def self.down
    drop_table :agendas
  end
end
