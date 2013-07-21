class AlterHorario < ActiveRecord::Migration
  def self.up
    drop_table :horarios
    remove_column :agendas, :horario_id
    add_column :agendas, :horario, :string
    add_column :estabelecimentos, :inicio, :string
    add_column :estabelecimentos, :fim, :string
    #add_column :especialidades, :duration, :string
  end

  def self.down
    create_table :horarios do |t|
      t.string :hora
      t.timestamps
    end
    add_column :agendas, :horario_id, :integer
    remove_column :agendas, :horario
    remove_column :estabelecimentos, :inicio
    remove_column :estabelecimentos, :fim
    #remove_column :especialidades, :duration
  end
end
