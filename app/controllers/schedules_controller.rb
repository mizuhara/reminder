class SchedulesController < ApplicationController
  before_action :set_schedules, only: [:index, :update]

  def index
    @schedule = Schedule.new
  end

  def update
  end

  def create
    @schedule = current_user.schedules.new(schedule_params.merge(user_id: current_user.id))
    if @schedule.save
      redirect_to root_path
    else
      set_schedules
      render 'index'
    end
  end

  def destroy
    @schedule = current_user.schedules.search_with(params[:id]).first
    @schedule.destroy unless @schedule.nil?
    redirect_to root_path
  end

  private

  def set_schedules
    start_date_time = params[:start_date_time] || Date.today
    @schedules = current_user.schedules.at(start_date_time.to_time.midnight)
  end

  def schedule_params
    params.require(:schedule).permit(:start_date_time, :detail)
  end
end
