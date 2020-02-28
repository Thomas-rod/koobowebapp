class SchedulesController < ApplicationController

  def index
  @schedules = Schedule.all
  @flats = current_user.flats
  @documents = Document.all
  end

  def create
    @schedule = Schedule.new(params_schedule)
    @flat = Flat.find(params[:flat_id])
    @schedule.flat = @flat
    @schedule.save!
    redirect_to flat_path(@flat)
  end

  # WE WILL NEED AN OTHER ROUTES TO REDIRECT TO THE CALENDAR WHEN WE ARE ON CALENDAR
  # def create_from_calendar
  #   @schedule = Schedule.new(params_schedule)
  #   @flat = Flat.find(params[:flat_id])
  #   @schedule.flat = @flat
  #   @schedule.save!
  #   redirect_to schedules_path
  # end

  def params_schedule
    params.require(:schedule).permit(:start, :end)
  end
end
