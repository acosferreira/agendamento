class Permissao < ActiveRecord::Base
  belongs_to :menu
belongs_to :grupo
  def self.load_permission(user_id, url)
    return [] if Usuario.find(user_id).name.upcase == 'ROOT'
    crud = [:create, :update, :delete, :read]
    user = Usuario.find_by_id(user_id).group_id

    unless user.nil?
      menu = Menu.find_by_name(url)
      unless menu.nil?
        permissions = Permissao.find(:all, :conditions=>["grupo_id=? and menu_id=?",user, menu.id])

        permissions.each do |p|
          crud =[]
          crud << :create unless p.add
          crud << :update unless p.change
          crud << :delete unless p.erase
          crud << :read unless p.view
        end
      end
    end

    crud
  end

  def self.load_submenu_permission(user_id, url)
    return [] if Usuario.find(user_id).name.upcase == 'ROOT'
    crud = [:create, :update, :delete, :read]

    user = Usuari.find_by_id(user_id).grupo_id

    unless user.nil?

      menu = Menu.find_by_name(url)

      if menu.nil?
        menu = Menu.find_by_url_menu(url)
      end
      unless menu.nil?
        submenu = Menu.find(:all, :conditions=>['menu_id=?', menu.id])
        unless submenu.nil?
          submenu.each do |s|
            permissions = Permissao.find(:all, :conditions=>["grupo_id=? and menu_id=?",user, s.id])
            permissions.each do |p|
              crud =[]
              crud << :create unless p.add
              crud << :update unless p.change
              crud << :delete unless p.erase
              crud << :read unless p.view
            end
          end
        end
      end
    end
    crud

  end

  def self.load_permission_controller(user_id, url)
    return [] if Usuario.find(user_id).name.upcase == 'ROOT'
    crud = [:create, :update, :delete, :read]
    user = Usuario.find_by_id(user_id).grupo_id
    unless user.nil?
      menu = Menu.find_by_name(url)

      if menu.nil?
        menu = Menu.find_by_url(url)
      end
      unless menu.nil?
        submenu = Menu.find(:all, :conditions=>['id=?', menu.id])
        unless submenu.nil?
          submenu.each do |s|
            permissions = Permissao.find(:all, :conditions=>["grupo_id=? and menu_id=?",user, s.id])
            permissions.each do |p|
              crud =[]
              crud << :create unless p.add
              crud << :update unless p.change
              crud << :delete unless p.erase
              crud << :read unless p.view
            end
          end
        end
      end
    end
    crud
  end


end
