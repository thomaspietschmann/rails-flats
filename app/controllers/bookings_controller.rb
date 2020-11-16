class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end


  def create
    flat = Flat.find(params[:flat_id])
    nights = params[:booking][:nights].to_i
    total_price = flat.price_per_night * nights
    @booking = Booking.new(
      nights: nights,
      total_price: total_price,
      flat: flat
    )
    @booking.client = Client.find(params[:booking][:client_id])
    if @booking.save
      flash[:success] = 'Object successfully created'
      redirect_to @booking
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end
end
