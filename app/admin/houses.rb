# coding: utf-8
ActiveAdmin.register House do
  scope :all, :default => true
  scope :get_completed
  scope :get_uncompleted

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
      fm.input :image, :as => :file,
                       :hint => fm.template.image_tag(fm.object.image.url)
    end
    f.inputs "Адрес",
      :for => [:location,
                if f.object.location
                  f.object.location
                else
                  f.object.build_location
                end
              ] do |fm|
      fm.input :name, :for => :location
      fm.input :address, :for => :location
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :description
      row :completed
      row :created_at
      row :updated_at
      row :apartments do |house|
        house.apartments.each do |apartment|
          ul
            li link_to "Название: #{apartment.title}, Описание: #{apartment.description}",
                       admin_apartment_path(apartment)
        end
      end
      row :image do |house|
        render :partial => "/admin/galleries/gallery",
               :locals => { :obj => house }
      end
      row :location do |house|
        render :partial => "/admin/locations/show_location",
               :locals => { :location => house.location }
      end
    end
    active_admin_comments
  end

  controller do
    def update
      house = House.find(params[:id])
      house_params = params[:house][:location_attributes]
      Delayed::Job.enqueue(UpdateLocationJob.new(house.location, house_params))
      update!
    end
  end
end
