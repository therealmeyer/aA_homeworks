class TracksController < ApplicationController

  before_action :require_logged_in
  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to album_url(@track.album_id)
    else
      flash[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to album_url(@track.album_id)
    else
      flash[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track.find(params[:id])
    id = @track.album_id
    @track.destroy
    redirect_to album_url(id)
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :title, :ord, :lyrics, :bonus)
  end

end
