ActiveAdmin.register Location do
  controller do
    def update
      location = Location.find(params[:id])
      temp_location = Location.create!(:address=>params[:location][:address],
                                       :name => params[:location][:name])
      respond_to do |format|
        if location.update_attributes(:address=>temp_location.address,
                                      :longitude=>temp_location.longitude,
                                      :latitude=>temp_location.latitude,
                                      :name => temp_location.name)
          format.html { redirect_to admin_location_path(location) }
        else
          format.html { render action: "edit" }
        end
      end
      temp_location.destroy
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
