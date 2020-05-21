class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
    @flat = Flat.find(params[:id])
  end

  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    # start_date = params[:booking][:start_date].gsub(" ","")
    # end_date = params[:booking][:end_date].gsub(" ","")
    # @booking.start_date = Date.strptime(start_date,'%m/%d/%Y')
    # @booking.end_date = Date.strptime(end_date,'%m/%d/%Y')
    @booking.flat = @flat
    @booking.user = current_user

    if @booking.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
