# coding: utf-8
ActiveAdmin.register House do
  scope :all, :default => true
  scope :get_completed_houses
  scope :get_uncompleted_houses

  index do
    column :id
    column 'Титул', :title
    column 'Описание', :description
    column 'Построен', :completed
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  form do |f|
      f.inputs "Дом" do
        f.input :title
        f.input :description, :label => "Описание"
        f.input :completed, :label => "Построен"
      end

      f.buttons
  end
end
