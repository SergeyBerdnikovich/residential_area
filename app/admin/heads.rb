# coding: utf-8
ActiveAdmin.register Head do
  show do
    attributes_table do
      row :id
      row :full_name
      row :position
      row :created_at
      row :updated_at
      row :address do |head|
        head.location.address if head.location
      end
      row :phone_number do
        PhoneNumber.find_all_by_head_id(params[:id]).each do |phone_number|
          ul
            li phone_number.number
        end
      end
      row :location do |head|
        render :partial => "/admin/locations/show_location", :locals => { :location => head.location }
      end
    end
    active_admin_comments
  end

  form :html => { :multipart => true } do |f|
    f.inputs "Руководитель" do
      f.input :full_name, :label => "ФИО"
      f.input :position, :label => "Должность"
    end
    f.inputs "Телефон",
     :for => [:phone_numbers,
               if f.object.phone_numbers.blank?
                 f.object.phone_numbers.build
               else
                 f.object.phone_numbers
               end
             ] do |fm|
      fm.input :number, :for => :phone_numbers
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
    f.buttons
  end

  controller do
    def update
      location = Location.find_by_head_id(params[:id])
      temp_location = Location.create!(:address => params[:head][:location_attributes][:address],
                                       :name => params[:head][:location_attributes][:name])
      if location
        location.update_attributes(:address => temp_location.address,
                                   :longitude => temp_location.longitude,
                                   :latitude => temp_location.latitude,
                                   :name => temp_location.name)
        temp_location.destroy
      else
        temp_location.update_attributes(:head_id => params[:id])
      end
      update!
    end
  end
end
