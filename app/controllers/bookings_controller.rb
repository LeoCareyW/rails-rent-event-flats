class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    if @booking.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to flat_path(@booking)
  end

  def index
    @booking = Booking.all
  end

  private

  def booking_params
    params.require(:dose).permit(:date)
  end
end
