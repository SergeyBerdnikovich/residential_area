require 'update_location_job'
ActiveAdmin.register Location do
  controller do
    def update
      Delayed::Job.enqueue(UpdateLocationJob.new(params[:id], params[:location]))
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
