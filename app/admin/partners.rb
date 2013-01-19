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
        PhoneNumber.find_all_by_partner_id(partner).each do |phone_number|
          ul
            li phone_number.number
        end
      end
      row :location do |partner|
        render :partial => "/admin/locations/show_location",
               :locals => { :location => partner.location }
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
    f.actions
  end

  controller do
    def update
      partner = Partner.find(params[:id])
      partner_params = params[:partner][:location_attributes]
      Delayed::Job.enqueue(UpdateLocationJob.new(partner.location, partner_params))
      update!
    end
  end
end
