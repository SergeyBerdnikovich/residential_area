ActiveAdmin.register Location do
  controller do
    def update
      location = Location.find(params[:id])
      temp_location = Location.create!(:address => params[:location][:address],
                                       :name => params[:location][:name],
                                       :gmaps => false)
      params[:location][:latitude] = temp_location.latitude
      params[:location][:longitude] = temp_location.longitude

      temp_location.destroy
      update!
    end
  end

  show do
    attributes_table do
      row :id
      row :name
      row :address
      row :longitude
      row :latitude
      row :house
      row :head
      row :partner
      row :gmaps
      row :created_at
      row :updated_at
      row :location do |location|
        render :partial => "show_location",
               :locals => { :location => location }
      end
    end
    active_admin_comments
  end
end
