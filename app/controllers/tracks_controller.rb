class TracksController < ApplicationController
  before_action :redirect_unless_logged_in

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    @track.update_attributes(track_params)
    @track.save!
    redirect_to track_url(@track)
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to bands_url
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end


private

  def track_params
    params.require(:track).permit(:name, :bonus, :album_id, :lyrics)
  end

end
