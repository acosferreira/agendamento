class AddUserRoot < ActiveRecord::Migration
  def self.up
    Usuario.create!(:name=>'Root', :login=> 'root', :password=>'root',:email=>'acosferreira@gmail.com')
  end

  def self.down
  end
end
