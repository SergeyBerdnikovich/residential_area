# coding: utf-8
ActiveAdmin.register News do
  index do
    column 'Ид', :id
    column 'Название', :title
    column 'Автор', :author do |news|
      news.user.name if news.user
    end
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :author do |news|
        news.user.name if news.user
      end
      row :created_at
      row :updated_at
      row :content do |news|
        News.sanitize_news(news.content).html_safe
      end
    end
    active_admin_comments
  end

  form :partial => "news_form"

  controller do
    def create
      params[:news][:user_id] = current_user.id
      create!
    end
  end
end