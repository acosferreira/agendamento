class CreatePermissaos < ActiveRecord::Migration
  def self.up
    create_table :permissaos do |t|
      t.integer :menu_id
      t.integer :grupo_id
      t.boolean :view
      t.boolean :add
      t.boolean :erase
      t.boolean :change

      t.timestamps
    end
  end

  def self.down
    drop_table :permissaos
  end
end
