# coding: utf-8
ActiveAdmin.register Role do
  index do
    column :id
    column 'Имя', :name

    default_actions
  end

  show do
    div do
      User.find_all_by_role_id(role).each do |user|
        ul
          li "Имя: #{user.name}, Эл. почта: #{user.email}"
      end
    end
  end
end
