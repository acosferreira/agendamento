class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :name
      t.integer :order
      t.string :url
      t.integer :menu_id

      t.timestamps
    end
  end

  def self.down
    drop_table :menus
  end
end
