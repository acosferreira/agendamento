class CreateEspecialidades < ActiveRecord::Migration
  def self.up
    create_table :especialidades do |t|
      t.string :name
      t.string :duration
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :especialidades
  end
end
