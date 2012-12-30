# coding: utf-8
ActiveAdmin.register House do
  scope :all, :default => true
  scope :get_completed_houses
  scope :get_uncompleted_houses

  index do
    column :id
    column 'Название', :title
    column 'Описание', :description
    column 'Построен', :completed
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  form do |f|
      f.inputs "Дом" do
        f.input :title, :label => "Название"
        f.input :description, :label => "Описание"
        f.input :completed, :label => "Построен"
      end
      f.inputs "Фото",
        :for => [:galleries,
                 if f.object.galleries.blank?
                   f.object.galleries.build
                 else
                   f.object.galleries
                 end
               ] do |fm|
        fm.input :image, :as => :file, :hint => fm.template.image_tag(fm.object.image.url(:thumb))
      end
      f.buttons
  end

  show do
    attributes_table do
      row :id
      row :title
      row :description
      row :completed
      row :created_at
      row :updated_at
      row :image do |house|
        render :partial => "/admin/galleries/gallery", :locals => { :obj => house }
      end
    end
    active_admin_comments
  end
end
