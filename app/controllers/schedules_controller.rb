class SchedulesController < ApplicationController

  def index
  @schedules = Schedule.all
  @flats = Flat.all
  end

  def create
    @schedule = Schedule.new(params_schedule)
    @schedule.flat = Flat.find(params[:flat_id])
    @schedule.save!
    redirect_to flat_path(@schedule.flat)
  end

  def params_schedule
    params.require(:schedule).permit(:start, :end)
  end
end
