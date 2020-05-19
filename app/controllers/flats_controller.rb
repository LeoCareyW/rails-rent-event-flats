class FlatsController < ApplicationController

def index
  @flats = Flat.all
end

def new
  @flat = Flat.new
end

def create
  @flat = Flat.new(flat_params)
  @flat.save

  redirect_to flat_path(@flat)
end

def show
  @flat = Flat.find(params[:id])
end

private

def flat_params
  params.require(:flat).permit(:name, :address, :description, :price)
end

end
