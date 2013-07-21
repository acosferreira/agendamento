class AddUserIdInAgenda < ActiveRecord::Migration
  def self.up
    add_column :agendas, :usuario_id, :integer
  end

  def self.down
    remove_column :agendas, :usuario_id
  end
end
