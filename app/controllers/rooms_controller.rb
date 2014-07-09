class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy, :enter, :leave]

  # GET /rooms
  def index
    @room = Room.find(session['room'])
  end

  # GET /rooms/1
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new

    if session[:user].blank?
      redirect_to new_user_path
    end
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room, notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  # POST /rooms/enter
  def enter
    @mapping = Mapping.new(user: session[:user], room: @room.id)
    @mapping.save

    session['room'] = @room.id

    redirect_to rooms_path
  end

  # POST /rooms/leave
  def leave
    Mapping.destroy_all(user: session[:user], room: @room.id)

    session.delete('room')

    redirect_to root_path
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      redirect_to @room, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
    redirect_to rooms_url, notice: 'Room was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :limit)
    end
end
