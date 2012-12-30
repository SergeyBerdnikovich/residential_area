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
    f.buttons
  end
end
