# coding: utf-8
ActiveAdmin.register Gallery do
  scope :all, :default => true
  scope :for_news

  index do
    column :id
    column :image do |gallery|
      image_tag gallery.image.url(:small)
    end
    column 'Имя', :image_file_name
    column 'Размер', :image_file_size
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  form do |f|
    f.inputs "Дом" do
      f.select("house_id", House.all.collect {|p| [ p.title, p.id ] }, { :include_blank => true })
    end
    f.inputs "Помещение" do
      f.select("apartment_id", Apartment.all.collect {|p| [ p.title, p.id ] }, { :include_blank => true })
    end
    f.inputs "Фото", :multipart => true do
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url)
    end
    f.buttons
  end

  show do
    attributes_table do
      row :id
      row :house do |gallery|
        link_to gallery.house.title, admin_house_path(gallery.house) if gallery.house
      end
      row :apartment do |gallery|
        link_to gallery.apartment.title, admin_apartment_path(gallery.apartment) if gallery.apartment
      end
      row :image_file_name
      row :image_content_type
      row :image_file_size
      row :created_at
      row :updated_at
      row :image do
        image_tag gallery.image.url(:normal)
      end
    end
    active_admin_comments
  end
end
