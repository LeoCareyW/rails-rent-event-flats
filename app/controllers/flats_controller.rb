class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

def index
  if params[:search].present?
    if params[:search][:query].present?
      @flats = Flat.search_by_address(params[:search][:query]).geocoded
    else
      @flats = Flat.all.geocoded
    end
  else
    @flats = Flat.all.geocoded
  end

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
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
