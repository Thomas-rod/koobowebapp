class RentingsController < ApplicationController

  def index
    @rentings = current_user.rentings
  end
end
