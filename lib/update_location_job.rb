class UpdateLocationJob < Struct.new(:locaton_id, :params_location)
  def perform
    temp_location = Location.create!(:address => params_location[:address],
                                     :name => params_location[:name],
                                     :gmaps => false)
    params_location[:latitude] = temp_location.latitude
    params_location[:longitude] = temp_location.longitude

    temp_location.destroy

    @location = Location.find(locaton_id)
    @location.update_attributes(params_location)
  end
end