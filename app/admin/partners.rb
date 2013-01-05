# coding: utf-8
ActiveAdmin.register Partner do
  show do
    attributes_table do
      row :id
      row :title
      row :description
      row :created_at
      row :updated_at
      row :address do
        partner.location.address if partner.location
      end
      row :phone_number do
        PhoneNumber.find_all_by_partner_id(partner.id).each do |phone_number|
          ul
            li phone_number.number
        end
      end
      row :location do |partner|
        render :partial => "/admin/locations/show_location", :locals => { :location => partner.location }
      end
    end
    active_admin_comments
  end

  form :html => { :multipart => true } do |f|
    f.inputs "Партнёр" do
      f.input :title, :label => "Название"
      f.input :description, :label => "Описание"
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
      location = Location.find_by_partner_id(params[:id])
      temp_location = Location.create!(:address => params[:partner][:location_attributes][:address],
                                       :name => params[:partner][:location_attributes][:name])
      if location
        location.update_attributes(:address => temp_location.address,
                                   :longitude => temp_location.longitude,
                                   :latitude => temp_location.latitude,
                                   :name => temp_location.name)
        temp_location.destroy
      else
        temp_location.update_attributes(:partner_id => params[:id])
      end
      update!
    end
  end
end
