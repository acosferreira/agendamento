class CreateDiaTrabalhos < ActiveRecord::Migration
  def self.up
    create_table :dia_trabalhos do |t|
      t.integer :profissional_especialidade_id
      t.integer :semana_id
      t.integer :estabelecimento_profissional_id
      t.timestamps
    end
  end

  def self.down
    drop_table :dia_trabalhos
  end
end
