class HomesController < ApplicationController

  # GET /homes
  def index
    @rooms = Room.all
  end

end
