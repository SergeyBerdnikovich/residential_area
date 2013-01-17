# coding: utf-8
ActiveAdmin.register User do
  index do
    column :id
    column 'Имя', :name
    column 'Эл. почта', :email
    column 'Кол. входов', :sign_in_count
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  form do |f|
    f.inputs "Роль" do
      f.select("role_id", Role.all.collect {|p| [ p.name, p.id ] }, { :include_blank => false })
    end
    f.inputs "Пользователь" do
      f.input :email, :label => "Эл. почта"
      f.input :password, :label => "Пароль"
      f.input :name, :label => "Имя"
    end
    f.actions
  end
end
