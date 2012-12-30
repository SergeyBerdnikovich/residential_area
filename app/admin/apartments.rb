# coding: utf-8
ActiveAdmin.register Apartment do
  form :html => { :multipart => true } do |f|
    f.inputs "Дом" do
      f.select("house_id", House.all.collect {|p| [ p.title, p.id ] }, { :include_blank => false })
    end
    f.inputs "Помещение" do
      f.input :title, :label => "Название"
      f.input :description, :label => "Описание"
      f.input :cost, :label => "Цена"
      f.input :space, :label => "Площадь"
      f.input :number_of_rooms, :label => "Кол. комнат"
      f.input :residential, :label => "Жилое помещение"
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
      row :house do |apartment|
        link_to apartment.house.title, admin_house_path(apartment.house) if apartment.house
      end
      row :title
      row :description
      row :cost
      row :space
      row :number_of_rooms
      row :residential
      row :created_at
      row :updated_at
      row :image do |apartment|
        render :partial => "/admin/galleries/gallery", :locals => { :obj => apartment }
      end
    end
    active_admin_comments
  end
end
