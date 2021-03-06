class BookingsController < ApplicationController
  before_action :authenticate_user!

  def preload
		item = Item.find(params[:item_id])
		today = Date.today
		bookings = item.bookings.where("start_date >= ? OR end_date >= ?", today, today)

		render json: bookings
	end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
			conflict: is_conflict(start_date, end_date)
		}

    render json: output
  end

  def create
    item = Item.find(params[:item_id])
    if current_user == item.user
      redirect_to item, notice: "You can't reserve your own room!"
    else
      @booking = current_user.bookings.create(booking_params)
      redirect_to @booking.item, notice: "Your booking has been created!"
    end
  end

  def your_rentals
    @rentals = current_user.bookings
  end

  def your_reservations
    @items = current_user.items
  end

  private

  def is_conflict(start_date, end_date)
    item = Item.find(params[:item_id])

    check = item.bookings.where("? < start_date AND end_date < ?", start_date, end_date)
    check.size > 0? true : false
  end

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :price, :total, :item_id)
    end
end
