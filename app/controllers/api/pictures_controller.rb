class Api::PicturesController < ApplicationController
  def show
    params[:id]
    begin
      @image = Dir["public/images/#{params[:id]}.*"].first
      type = "image/png"
      if Pathname.new(@image).extname == ".jpg"
        type = "image/jpeg"
      end
      send_file @image, type: type, disposition: 'inline', status: 200
    rescue Exception => e
      render text: "Not found", status: 404
    end
  end
end
