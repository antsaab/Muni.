class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @posts = Post.where(room_id:@room.id)
  end
  def create
    @room = Room.new(room_params)
    @room.save
    current_user.user_rooms.create(room_id: @room.id)
    redirect_to @room
  end

  def index
      if user_signed_in?
        @room = Room.new
        @rooms = current_user.rooms
        @norooms_id = UserRoom.where.not(user_id:current_user.id)
      end
  end

  private

  def room_params
  　params.require(:room).permit(:name)
  end
end
