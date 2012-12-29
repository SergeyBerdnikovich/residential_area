# coding: utf-8
ActiveAdmin.register Gallery do
  form do |f|
    f.inputs "Дом" do
      f.select("house_id", House.all.collect {|p| [ p.title, p.id ] }, { :include_blank => true })
    end
    f.inputs "Помещение" do
      f.select("apartment_id", Apartment.all.collect {|p| [ p.title, p.id ] }, { :include_blank => true })
    end
    f.inputs "Фото", :multipart => true do
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:thumb))
    end
    f.buttons
  end
end
