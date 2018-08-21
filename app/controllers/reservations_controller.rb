class ReservationsController < ApplicationController
    def create
        room = Room.find(params[:room_id]) 
      start_date = Date.parse(reservations_params[:start_date])
      end_date = Date.parse(reservations_params[:end_date])
      days = (end_date - start_date).to_i
      
      reservations = current_user.reservations.build(reservations_params)
      reservations.room = room
      reservations.price = room.price
      reservations.total = room.price * days
      reservations.save
        
      flash[:notice] = "booking success"
      redirect_to room

    end

    def new 
        @room = Room.find(params[:room_id])
    end 

    private 
        def reservations_params
        params.require(:reservation).permit(:start_date, :end_date)
       end
end
