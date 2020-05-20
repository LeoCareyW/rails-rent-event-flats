class FlatsController < ApplicationController

def index
  @flats = Flat.all

    @flats = Flat.geocoded # returns flats with coordinates

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
  end
end

def new
  @flat = Flat.new
end

def create
  @flat = Flat.new(flat_params)
  @flat.user = current_user
  if @flat.save
    redirect_to flat_path(@flat)
  else
    render :new
  end
end

def show
  @flat = Flat.find(params[:id])
end

def edit
  @flat = Flat.find(params[:id])
end

def update
  @flat = Flat.find(params[:id])
  @flat.update(flat_params)

  if @flat.save
      redirect_to flat_path(@flat)
  else
      render :new
  end
end


private

def flat_params
  params.require(:flat).permit(:name, :address, :description, :price, :pool, :wifi, :speakers, :smoking, :icemaker, :cleaner, photos: [])
end

end
