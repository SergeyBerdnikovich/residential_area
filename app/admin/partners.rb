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
    f.buttons
  end
end
