class AlbumsController < ApplicationController

  before_action :require_logged_in
  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band_id)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to band_url(@album.band_id)
    else
      flash[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album.find(params[:id])
    id = @album.band_id
    @album.destroy
    redirect_to band_url(id)
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :title, :year, :studio)
  end

end
