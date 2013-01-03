ActiveAdmin.register Location do
  controller do
    def update
      location = Location.find(params[:id])
      temp_location = Location.create!(:address=>params[:location][:address])

      respond_to do |format|
        if location.update_attributes(:address=>temp_location.address,
                                      :longitude=>temp_location.longitude,
                                      :latitude=>temp_location.latitude)
          format.html { redirect_to admin_location_path(location) }
        else
          format.html { render action: "edit" }
        end
      end
    temp_location.destroy
    end
  end
end
