class TinymceAssetsController < ApplicationController
  def create
    # Take upload from params[:file] and store it somehow...
    # Optionally also accept params[:hint] and consume if needed
    render json: {
      image: {
        #url: view_context.image_url(image)
        url: "http://cs402430.userapi.com/v402430792/9ee0/RiARI2rpUjk.jpg"
      }
    }, content_type: "text/html"
  end
end
