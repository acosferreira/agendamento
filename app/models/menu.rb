class Menu < ActiveRecord::Base
  belongs_to :menu
  has_many :permissaos


  def self.load_menu
    Menu.find(:all, :conditions=>["menu_id is null"])
  end

  def self.load_submenu(menu_id)
    Menu.find(:all, :conditions=>["menu_id = ?", menu_id])
  end
end
