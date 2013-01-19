class UpdateLocationJob < Struct.new(:obj, :obj_params)
  def perform
    temp_location = Location.create!(:address => obj_params[:address],
                                     :name => obj_params[:name],
                                     :gmaps => false)
    if obj
      obj_params[:latitude] = temp_location.latitude
      obj_params[:longitude] = temp_location.longitude

      temp_location.destroy

      obj.update_attributes(obj_params)
    end
  end
end