class AlbumsController < ApplicationController
  before_action :redirect_unless_logged_in

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    @album.update_attributes(album_params)

    @album.save!
    redirect_to album_url(@album)
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to bands_url
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end


private

  def album_params
    params.require(:album).permit(:title, :band_id, :live_album)
  end

end
